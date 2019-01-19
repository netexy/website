<?php

namespace AppBundle\Content\Structure;

use PHPCR\NodeInterface;
use Sulu\Bundle\ContentBundle\Content\Structure\SeoStructureExtension as BaseSeoStructureExtension;

/**
 * {@inheritdoc}
 */
class SeoStructureExtension extends BaseSeoStructureExtension
{
    protected $seoAttributes = [
        'hideInSitemap',
        'noIndex',
        'noFollow',
        'canonicalUrl',
        // custom ones
        'facebookAppID',
        'siteName',
        'pageName',
        'twitterSite',
        'faviconUri',
        'webManifestUri',
        'maskIconUri',
        'hexTheme',
        'barStyle',
    ];

    /**
     * {@inheritdoc}
     */
    protected $properties = [
        'title',
        'description',
        'keywords',
        'canonicalUrl',
        'noIndex',
        'noFollow',
        'hideInSitemap',
        // custom ones
        'facebookAppID',
        'siteName',
        'pageName',
        'twitterSite',
        'faviconUri',
        'webManifestUri',
        'maskIconUri',
        'hexTheme',
        'barStyle',
    ];

    /**
     * {@inheritdoc}
     */
    public function save(NodeInterface $node, $data, $webspaceKey, $languageCode)
    {
        parent::save($node, $data, $webspaceKey, $languageCode);

        $this->saveProperty($node, $data, 'facebookAppID');
        $this->saveProperty($node, $data, 'siteName');
        $this->saveProperty($node, $data, 'pageName');
        $this->saveProperty($node, $data, 'twitterSite');
        $this->saveProperty($node, $data, 'faviconUri');
        $this->saveProperty($node, $data, 'webManifestUri');
        $this->saveProperty($node, $data, 'maskIconUri');
        $this->saveProperty($node, $data, 'hexTheme');
        $this->saveProperty($node, $data, 'barStyle');
    }

    /**
     * {@inheritdoc}
     */
    public function load(NodeInterface $node, $webspaceKey, $languageCode)
    {
        $result = parent::load($node, $webspaceKey, $languageCode);

        $newProps = [
            'facebookAppID',
            'siteName',
            'pageName',
            'twitterSite',
            'faviconUri',
            'webManifestUri',
            'maskIconUri',
            'hexTheme',
            'barStyle',
        ];

        foreach ($newProps as $prop) {
            $result[$prop] = $this->loadProperty($node, $prop);
        }

        return $result;
    }
}
