<?php

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;

class AppKernel extends Kernel
{
    public function registerBundles()
    {
        $bundles = array(
            new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new Symfony\Bundle\TwigBundle\TwigBundle(),
            new Symfony\Bundle\MonologBundle\MonologBundle(),
            new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new Symfony\Bundle\AsseticBundle\AsseticBundle(),
            new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle(),
            new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),

            new Sli\AuxBundle\SliAuxBundle(),
            new Sli\ExpanderBundle\SliExpanderBundle($this),
            new Knp\Bundle\GaufretteBundle\KnpGaufretteBundle(),
            new Modera\FoundationBundle\ModeraFoundationBundle(),
            new Modera\UpgradeBundle\ModeraUpgradeBundle(),
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
            new Modera\BackendModuleBundle\ModeraBackendModuleBundle(),
            new Modera\BackendSecurityBundle\ModeraBackendSecurityBundle(),
            new Modera\BackendLanguagesBundle\ModeraBackendLanguagesBundle(),
            new Modera\BackendTranslationsToolBundle\ModeraBackendTranslationsToolBundle(),
            new Modera\BackendToolsActivityLogBundle\ModeraBackendToolsActivityLogBundle(),
            new Modera\BackendToolsSettingsBundle\ModeraBackendToolsSettingsBundle(),
            new Modera\BackendConfigUtilsBundle\ModeraBackendConfigUtilsBundle(),
            new Modera\BackendDashboardBundle\ModeraBackendDashboardBundle(),
        );

        if (in_array($this->getEnvironment(), array('dev', 'test'))) {
            $bundles[] = new Symfony\Bundle\DebugBundle\DebugBundle();
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
            $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();
        }

        return $bundles;
    }

    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(__DIR__ . '/config/config_' . $this->getEnvironment() . '.yml');
    }
}

