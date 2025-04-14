<?php

namespace App\Contribution;

use Modera\ExpanderBundle\Ext\ContributorInterface;

class ClassLoaderMappingsProvider implements ContributorInterface
{
    public function getItems(): array
    {
        return [
            'App.welcome' => '/app/welcome/js',
        ];
    }
}
