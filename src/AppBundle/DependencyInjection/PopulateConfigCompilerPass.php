<?php

namespace AppBundle\DependencyInjection;

//use Acme\DemoBundle\YourService;
use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;

class OverrideServiceCompilerPass implements CompilerPassInterface
{
    public function process(ContainerBuilder $container)
    {
        die('sdf');
        $definition = $container->getDefinition('original-service-id');
//        $definition->setClass(YourService::class);
    }
}
