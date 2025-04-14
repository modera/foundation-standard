<?php

namespace App\Contribution;

use Modera\ExpanderBundle\Ext\OrderedContributorInterface;
use Modera\FoundationBundle\Translation\T;
use Modera\MjrIntegrationBundle\Menu\MenuItem;
use Modera\MjrIntegrationBundle\Model\FontAwesome;

class MenuItemsProvider implements OrderedContributorInterface
{
    public function getItems(): array
    {
        return [
            new MenuItem(
                T::trans('Welcome'),
                'App.welcome.runtime.Section',
                'welcome',
                [],
                FontAwesome::resolve('symfony', 'fab'),
            ),
        ];
    }

    public function getOrder(): int
    {
        return \PHP_INT_MIN;
    }
}
