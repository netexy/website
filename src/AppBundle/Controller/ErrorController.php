<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\Request;

class ErrorController extends Controller
{
    /**
     * Returns the SVG file for the given $id.
     *
     * @param Request $request
     * @param integer $id
     *
     * @return BinaryFileResponse
     */
    public function indexAction(Request $request)
    {
        return $this->renderView('@App/error.html.twig');
    }
}
