<?php
/**
 * Created by Dmitry Prokopenko
 * https://github.com/dmitry-pro
 * Date: 2/28/18
 * Time: 12:28
 */

namespace AppBundle\Teaser;

use ONGR\ElasticsearchBundle\Service\Manager;
use ONGR\ElasticsearchDSL\Query\TermLevel\IdsQuery;
use Sulu\Bundle\ArticleBundle\Document\ArticleViewDocument;
use Sulu\Bundle\ArticleBundle\Metadata\ArticleViewDocumentIdTrait;
use Sulu\Bundle\ContentBundle\Teaser\Configuration\TeaserConfiguration;
use Sulu\Bundle\ContentBundle\Teaser\Provider\TeaserProviderInterface;
use Sulu\Bundle\ContentBundle\Teaser\Teaser;
use Symfony\Component\Translation\TranslatorInterface;

class MediaTeaserProvider implements TeaserProviderInterface
{
    use ArticleViewDocumentIdTrait;

    /**
     * @var Manager
     */
    private $searchManager;

    /**
     * @var TranslatorInterface
     */
    private $translator;

    /**
     * @var string
     */
    private $documentClass;

    /**
     * @param Manager              $searchManager
     * @param TranslatorInterface  $translator
     * @param                     $articleDocumentClass
     */
    public function __construct(Manager $searchManager, TranslatorInterface $translator, $articleDocumentClass)
    {
        $this->searchManager = $searchManager;
        $this->translator = $translator;
        $this->articleDocumentClass = $articleDocumentClass;
    }
//
//    /**
//     * Returns the configuration for rendering the teaser provider in the
//     * administration interface
//     *
//     * @return TeaserProvider
//     */
//    public function getConfiguration()
//    {
//        return new TeaserConfiguration(
//            // The title in the dropdown of the administration interface
//            'Recipe',
//            // The JavaScript component started for selecting the content
//            // In this case, we use the generic list component
//            'teaser-selection/list@sulucontent',
//            [                                 // Options of the JavaScript component
//                                              'url'          => '/admin/api/recipe', // The API URL
//                                              'resultKey'    => 'recipes',
//                                              // The key in the JSON returned by the API
//                                              'searchFields' => ['title'],
//                                              // The fields passed to the API when filtering for content
//                                              'matchings'    => [              // The columns shown in the list
//                                                                               [
//                                                                                   'content' => 'Title',
//                                                                                   // The column title
//                                                                                   'name'    => 'title',
//                                                                                   // The field shown in the column
//                                                                               ],
//                                                                               [
//                                                                                   'content' => 'Rating',
//                                                                                   'name'    => 'rating',
//                                                                               ],
//                                              ],
//            ]
//        );
//    }

    /**
     * {@inheritdoc}
     */
    public function getConfiguration()
    {
        $okDefaultText = $this->translator->trans('sulu-content.teaser.apply', [], 'backend');

        return new TeaserConfiguration(
            'sulu_media.teaser',
            'teaser-media-selection/list@frameworkapp',
            [
                'url'          => '/admin/api/articles?locale={locale}',
                'resultKey'    => 'articles',
                'searchFields' => ['title', 'route_path', 'changer_full_name', 'creator_full_name', 'author_full_name'],
            ],
            [
                [
                    'title'          => $this->translator->trans('sulu_article.authored', [], 'backend'),
                    'cssClass'       => 'authored-slide',
                    'contentSpacing' => true,
                    'okDefaultText'  => $okDefaultText,
                    'buttons'        => [
                        [
                            'type'  => 'ok',
                            'align' => 'right',
                        ],
                        [
                            'type'  => 'cancel',
                            'align' => 'left',
                        ],
                    ],
                ],
                [
                    'title'          => $this->translator->trans(
                        'sulu_article.contact-selection-overlay.title',
                        [],
                        'backend'
                    ),
                    'cssClass'       => 'contact-slide',
                    'contentSpacing' => true,
                    'okDefaultText'  => $okDefaultText,
                    'buttons'        => [
                        [
                            'type'  => 'ok',
                            'align' => 'right',
                        ],
                        [
                            'type'  => 'cancel',
                            'align' => 'left',
                        ],
                    ],
                ],
                [
                    'title'          => $this->translator->trans(
                        'sulu_article.category-selection-overlay.title',
                        [],
                        'backend'
                    ),
                    'cssClass'       => 'category-slide',
                    'contentSpacing' => true,
                    'okDefaultText'  => $okDefaultText,
                    'buttons'        => [
                        [
                            'type'  => 'ok',
                            'align' => 'right',
                        ],
                        [
                            'type'  => 'cancel',
                            'align' => 'left',
                        ],
                    ],
                ],
                [
                    'title'          => $this->translator->trans(
                        'sulu_article.tag-selection-overlay.title',
                        [],
                        'backend'
                    ),
                    'cssClass'       => 'tag-slide',
                    'contentSpacing' => true,
                    'okDefaultText'  => $okDefaultText,
                    'buttons'        => [
                        [
                            'type'  => 'ok',
                            'align' => 'right',
                        ],
                        [
                            'type'  => 'cancel',
                            'align' => 'left',
                        ],
                    ],
                ],
                [
                    'title'          => $this->translator->trans('public.choose', [], 'backend'),
                    'cssClass'       => 'page-slide data-source-slide',
                    'contentSpacing' => false,
                    'okDefaultText'  => $okDefaultText,
                    'buttons'        => [
                        [
                            'type'  => 'ok',
                            'align' => 'right',
                        ],
                        [
                            'type'  => 'cancel',
                            'align' => 'left',
                        ],
                    ],
                ],
            ]
        );
    }

    /**
     * {@inheritdoc}
     */
    public function find(array $ids, $locale)
    {
        if (0 === count($ids)) {
            return [];
        }

        $articleIds = $this->getViewDocumentIds($ids, $locale);

        $repository = $this->searchManager->getRepository($this->documentClass);
        $search = $repository->createSearch();
        $search->addQuery(new IdsQuery($articleIds));

        $result = [];
        foreach ($repository->findDocuments($search) as $item) {
            $excerpt = $item->getExcerpt();
            $result[] = new Teaser(
                $item->getUuid(),
                'article',
                $item->getLocale(),
                ('' !== $excerpt->title ? $excerpt->title : $item->getTitle()),
                ('' !== $excerpt->description ? $excerpt->description : $item->getTeaserDescription()),
                $excerpt->more,
                $item->getRoutePath(),
                count($excerpt->images) ? $excerpt->images[0]->id : $item->getTeaserMediaId(),
                $this->getAttributes($item)
            );
        }

        return $result;
    }

    /**
     * Returns attributes for teaser.
     *
     * @param ArticleViewDocument $viewDocument
     *
     * @return array
     */
    protected function getAttributes(ArticleViewDocument $viewDocument)
    {
        return [
            'structureType' => $viewDocument->getStructureType(),
            'type'          => $viewDocument->getType(),
        ];
    }
}
