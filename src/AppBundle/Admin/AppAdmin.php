<?php

namespace AppBundle\Admin;

use Sulu\Bundle\AdminBundle\Admin\Admin;
use Sulu\Bundle\AdminBundle\Navigation\Navigation;
use Sulu\Bundle\AdminBundle\Navigation\NavigationItem;

class AppAdmin extends Admin
{
    /**
     * WebspaceAdmin constructor.
     *
     * @param string $title
     */
    public function __construct($title)
    {
        $rootNavigationItem = new NavigationItem($title);

        $global = new NavigationItem('navigation.modules', $rootNavigationItem);
        $webspace = new NavigationItem('navigation.webspace2', $global);
        $webspace->setAction('netexy/webspace2');
        $webspace->setIcon('globe');
        $webspace->setPosition(25);

        $this->setNavigation(new Navigation($rootNavigationItem));
    }

    /**
     * @return string
     */
    public function getJsBundleName()
    {
        return 'suluframework';
    }
}
