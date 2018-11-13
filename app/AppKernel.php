<?php

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Modera\DynamicallyConfigurableAppBundle\KernelConfig;

class AppKernel extends Kernel
{
    /**
     * @return array
     */
    public static function config()
    {
        return KernelConfig::read();
    }

    /**
     * {@inheritdoc}
     */
    public function registerBundles()
    {
        $bundles = array(
            new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new Symfony\Bundle\TwigBundle\TwigBundle(),
            new Symfony\Bundle\MonologBundle\MonologBundle(),
            new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),

            new Sli\AuxBundle\SliAuxBundle(),
            new Sli\ExpanderBundle\SliExpanderBundle($this),
            new Knp\Bundle\GaufretteBundle\KnpGaufretteBundle(),

            new Modera\FoundationBundle\ModeraFoundationBundle(),
            new Modera\ModuleBundle\ModeraModuleBundle(),
            new Modera\RoutingBundle\ModeraRoutingBundle(),
            new Modera\SecurityBundle\ModeraSecurityBundle(),
            new Modera\LanguagesBundle\ModeraLanguagesBundle(),
            new Modera\TranslationsBundle\ModeraTranslationsBundle(),
            new Modera\ActivityLoggerBundle\ModeraActivityLoggerBundle(),
            new Modera\ConfigBundle\ModeraConfigBundle(),
            new Modera\DynamicallyConfigurableAppBundle\ModeraDynamicallyConfigurableAppBundle(),
            new Modera\FileRepositoryBundle\ModeraFileRepositoryBundle(),
            new Modera\FileUploaderBundle\ModeraFileUploaderBundle(),

            new Sli\ExtJsIntegrationBundle\SliExtJsIntegrationBundle(),
            new Modera\MjrIntegrationBundle\ModeraMjrIntegrationBundle(),
            new Modera\DirectBundle\ModeraDirectBundle(),
            new Modera\MJRThemeIntegrationBundle\ModeraMJRThemeIntegrationBundle(),
            new Modera\MJRSecurityIntegrationBundle\ModeraMJRSecurityIntegrationBundle(),
            new Modera\MJRCacheAwareClassLoaderBundle\ModeraMJRCacheAwareClassLoaderBundle(),
            new Modera\DynamicallyConfigurableMJRBundle\ModeraDynamicallyConfigurableMJRBundle(),
            new Modera\ServerCrudBundle\ModeraServerCrudBundle(),
            new Modera\BackendToolsBundle\ModeraBackendToolsBundle(),
            new Modera\BackendSecurityBundle\ModeraBackendSecurityBundle(),
            new Modera\BackendLanguagesBundle\ModeraBackendLanguagesBundle(),
            new Modera\BackendTranslationsToolBundle\ModeraBackendTranslationsToolBundle(),
            new Modera\BackendToolsActivityLogBundle\ModeraBackendToolsActivityLogBundle(),
            new Modera\BackendToolsSettingsBundle\ModeraBackendToolsSettingsBundle(),
            new Modera\BackendConfigUtilsBundle\ModeraBackendConfigUtilsBundle(),
            new Modera\BackendDashboardBundle\ModeraBackendDashboardBundle(),
        );

        if (in_array($this->getEnvironment(), ['dev', 'test'], true)) {
            $bundles[] = new Symfony\Bundle\DebugBundle\DebugBundle();
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();

            if ('dev' === $this->getEnvironment()) {
                $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();
                $bundles[] = new Symfony\Bundle\WebServerBundle\WebServerBundle();
            }
        }

        return $bundles;
    }

    /**
     * {@inheritdoc}
     */
    public function getRootDir()
    {
        return __DIR__;
    }

    /**
     * {@inheritdoc}
     */
    public function getCacheDir()
    {
        return dirname(__DIR__) . '/var/cache/' . $this->getEnvironment();
    }

    /**
     * {@inheritdoc}
     */
    public function getLogDir()
    {
        return dirname(__DIR__) . '/var/logs';
    }

    /**
     * {@inheritdoc}
     */
    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(function (ContainerBuilder $container) {
            $container->setParameter('container.autowiring.strict_mode', true);
            $container->setParameter('container.dumper.inline_class_loader', true);
            $container->addObjectResource($this);
        });
        $loader->load($this->getRootDir() . '/config/config_' . $this->getEnvironment() . '.yml');
    }
}

