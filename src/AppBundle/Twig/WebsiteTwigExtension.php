<?php

namespace AppBundle\Twig;

use Sulu\Component\Util\SortUtils;

/**
 * Twig extension for rendering the Sitemap.
 */
class WebsiteTwigExtension extends \Twig_Extension
{
    /**
     * {@inheritdoc}
     */
    public function getFunctions()
    {
        return [
            new \Twig_SimpleFunction('app_sitemap', [$this, 'getSitemapStructure']),
            new \Twig_SimpleFunction('app_picture', [$this, 'getPictureTag']),
            new \Twig_SimpleFunction('array_split_by_double_underscore', [$this, 'splitArrayByDU']),
            new \Twig_SimpleFunction('youtube_video', [$this, 'youtubeVideo']),
        ];
    }

    public function getFilters()
    {
        return [
            new \Twig_SimpleFilter('readtime', [$this, 'readtimeFilter']),
            new \Twig_SimpleFilter('json_decode', [$this, 'jsonDecode']),
            new \Twig_SimpleFilter('unescape', function($value) {
                return html_entity_decode($value);
            }),
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function getName()
    {
        return 'app_website';
    }

    /**
     * @param $link
     *
     * @return string
     */
    public function youtubeVideo($link)
    {
        preg_match('/\?v=([^#]+)\#?[\w]*|youtu\.be\/([^#]+)/', $link, $matches);
        $videoId = $matches[2] ?? $matches[1] ?? null;
        if ($videoId) {
            $embedLink = 'https://www.youtube.com/embed/' . $videoId . '?enablejsapi=1';
            $template = '<iframe width="560" height="315" src="%s" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';

            return sprintf($template, $embedLink);
        }
    }

    public function splitArrayByDU($array)
    {
        if (is_object($array)) {
            $array = iterator_to_array($array);
        }
        $_array = $array;
        foreach ($_array as $key => &$sub) {
            if (is_string($key) && strpos($key, '__') !== false) {
                self::setArrayKeyByDUNotation($_array, $key, $sub);
                unset($_array[$key]);
            }
        }

        return $_array;
    }

    /**
     * Set an array item to a given value using "double underscore" notation.
     *
     * If no key is given to the method, the entire array will be replaced.
     *
     * @param  array   $array
     * @param  string  $key
     * @param  mixed   $value
     * @return array
     */
    public static function setArrayKeyByDUNotation(&$array, $key, $value)
    {
        if (is_null($key)) {
            return $array = $value;
        }

        $keys = explode('__', $key);

        while (count($keys) > 1) {
            $key = array_shift($keys);

            // If the key doesn't exist at this depth, we will just create an empty array
            // to hold the next value, allowing us to create the arrays to hold final
            // values at the correct depth. Then we'll keep digging into the array.
            if (! isset($array[$key]) || ! is_array($array[$key])) {
                $array[$key] = [];
            }

            $array = &$array[$key];
        }

        $array[array_shift($keys)] = $value;

        return $array;
    }

    /**
     * Returns a picture tag with the given breakpoints.
     *
     * @param string $defaultImageUrl
     * @param string $title
     * @param array  $breakpoints
     * @param string $class
     *
     * @return string
     */
    public function getPictureTag($defaultImageUrl, $title, $breakpoints, $class = '')
    {
        $breakpointSources = '';

        if (!empty($breakpoints)) {
            foreach ($breakpoints as $breakpoint => $imageUrl) {
                $media = $breakpoint ? 'media=" ' . $breakpoint . ' "' : '';
                $path = ' srcset="' . $imageUrl[0] . ($imageUrl[1] ? ', ' . $imageUrl[1] . ' 2x' : '') . '"';
                $breakpointSources .= '<source' . $media . $path . '">';
            }
        }

        if ($class) {
            $class = ' class= "' . $class . '"';
        }

        return '<picture>
                    ' . $breakpointSources . '
                    <img' . $class . ' src="' . $defaultImageUrl . '" alt="' . $title . '"/>
                </picture>';
    }

    /**
     * Returns the correctly structured Sitemap.
     *
     * @param array $tree
     *
     * @return array
     */
    public function getSitemapStructure($tree)
    {
        $result = [];
        $home = $tree;
        $homeChilds = [];

        foreach ($tree['children'] as $child) {
            array_push($homeChilds, $child);
        }

        $home['rows'] = $this->splitIntoRows($homeChilds, 3);
        $home['children'] = SortUtils::multisort($tree['children'], '[order]', 'asc');
        array_unshift($result, $home);

        return $result;
    }

    /**
     * @param string $content
     *
     * @return string
     */
    public function readtimeFilter($content)
    {
        $words = str_word_count(strip_tags($content));
        $min = floor($words / 200);
        $return = ($min < 1 ? '1' : $min) . ' minute';

        return $return;
    }

    /**
     * Splits elements into Rows.
     *
     * @param array $elements
     * @param int   $maxRows
     *
     * @return array
     */
    private function splitIntoRows($elements, $maxRows)
    {
        $result = [];

        if (count($elements) > 5 && $maxRows > 1) {
            $rows = (count($elements) > 10 && $maxRows >= 3 ? 2 : 1);
            $row = 0;

            for ($i = 0; $i <= $rows; ++$i) {
                $result[ $i ] = [];
            }

            foreach ($elements as $element) {
                array_push($result[ $row ], $element);
                ++$row;
                $row = ($row > $rows ? 0 : $row);
            }
        } else {
            $result = [$elements];
        }

        return $result;
    }

    /**
     * Missing json_decode hepler
     *
     * @param string $string
     *
     * @return array
     */
    public function jsonDecode($string)
    {
        return json_decode($string, true);
    }
}
