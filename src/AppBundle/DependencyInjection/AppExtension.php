<?php

namespace AppBundle\DependencyInjection;

use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Loader\XmlFileLoader;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;
use Symfony\Component\DependencyInjection\Extension\PrependExtensionInterface;

class AppExtension extends Extension implements PrependExtensionInterface, CompilerPassInterface
{
    /**
     * {@inheritdoc}
     */
    public function process(ContainerBuilder $container)
    {
        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function prepend(ContainerBuilder $container)
    {
        $articleTemplates = [];
        if ($container->hasExtension('sulu_core')) {
            $path = $container->getParameter('kernel.root_dir') . '/Resources/templates/pages';
            $directories = new \DirectoryIterator($path);
            foreach ($directories as $directory) {
                if ($directory->isDir() && !$directory->isDot()) {
                    $container->prependExtensionConfig(
                        'sulu_core',
                        [
                            'content' => [
                                'structure' => [
                                    'paths' => [
                                        [
                                            'path' => $directory->getPathname(),
                                            'type' => 'page',
                                        ],
                                    ],
                                ],
                            ],
                        ]
                    );
                    $container->prependExtensionConfig(
                        'sulu_core',
                        [
                            'content' => [
                                'structure' => [
                                    'paths' => [
                                        [
                                            'path' => $directory->getPathname(),
                                            'type' => 'home',
                                        ],
                                    ],
                                ],
                            ],
                        ]
                    );
                }
            }

            $path = $container->getParameter('kernel.root_dir') . '/Resources/templates/articles';
            $articleTemplates = glob($path . '/{**/*.xml,*.xml}', \GLOB_BRACE);
            $directories = new \DirectoryIterator($path);
            foreach ($directories as $directory) {
                if (!$directory->isDot()) {
                    if ($directory->isDir()) {
                        $container->prependExtensionConfig(
                            'sulu_core',
                            [
                                'content' => [
                                    'structure' => [
                                        'paths' => [
                                            [
                                                'path' => $directory->getPathname(),
                                                'type' => 'article',
                                            ],
                                        ],
                                    ],
                                ],
                            ]
                        );
                    } else {
                        $pathinfo = pathinfo($directory->getFilename());
                        $extension = $pathinfo['extension'];
                        if ('xml' == $extension) {
                            $articleTemplates[] = $directory->getPathname();
                        }
                    }
                }
            }
        }

        if ($container->hasExtension('sulu_route')) {
            foreach ($articleTemplates as $template) {
                $doc = new \DOMDocument();
                $doc->load($template);
                $xPath = new \DOMXpath($doc);
                $keyElements = $xPath->query("/*[name()='template']/*[name()='key']");

                $key = null;
                $path = null;

                if (!is_null($keyElements)) {
                    /** @var \DOMElement $element */
                    foreach ($keyElements as $element) {
                        $key = $element->textContent;
//                        $path = '/' . strtr($key, ['__' => '/']) . '/{object.getTitle()}';
                        $path = '/content/{object.getTitle()}';
                    }
                }

                $container->prependExtensionConfig(
                    'sulu_route',
                    [
                        'mappings' => [
                            'Sulu\Bundle\ArticleBundle\Document\ArticleDocument' => [
                                'generator' => 'template',
                                'options' => [
                                    $key => $path,
                                ],
                            ],
                        ],
                    ]
                );
            }
        }
    }

    /**
     * {@inheritdoc}
     */
    public function load(array $configs, ContainerBuilder $container)
    {
        $loader = new XmlFileLoader(
            $container,
            new FileLocator(__DIR__ . '/../Resources/config')
        );
        $loader->load('services.xml');
    }
}
