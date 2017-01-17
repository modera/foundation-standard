# Upgrade guide

## 0.9

* Update your composer.json file so it would use modera/foundation fat-repo instead of directly specifying all nested
packages. See [composer.json changeset](https://github.com/modera/foundation-standard/commit/52db17a084bf1a0461e47a98dd7353178c4ccbc7#diff-b5d0ee8c97c7abd7e3fa29b9a27d1780) for more details.
One composer.json has been updated don't forget to run `composer update`.

## from 0.7 to 0.8

* Make sure that your composer.json includes "repositories" section
as well as two new dependencies - modera/mjr, modera/theme. For details see this 
[composer.json changeset](https://github.com/modera/foundation-standard/commit/298da9ff06848f4aca53b2e5926268ff40bacce0#diff-b5d0ee8c97c7abd7e3fa29b9a27d1780).
* Run `composer update`, it is very important that you would have a latest version of
[composer-symfony-web-asset-installer-plugin plugin](https://github.com/modera/composer-symfony-web-asset-installer-plugin). This
plugin is used to install "mjr" and "theme" to `web` directory.
* Delete `.mjr` directory
* Update `.mcloud/php.run.sh` script so it would not include execution of .mjr/install.sh script as illustrated
in [this changeset](https://github.com/modera/foundation-standard/commit/298da9ff06848f4aca53b2e5926268ff40bacce0#diff-1679d624c11b6620fada67b70579887b).

Related commits:
* [298da9ff06848f4aca53b2e5926268ff40bacce0](https://github.com/modera/foundation-standard/commit/298da9ff06848f4aca53b2e5926268ff40bacce0)