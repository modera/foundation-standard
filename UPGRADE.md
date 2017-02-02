# Upgrade guide

## 0.11 (not released yet)

* [MPFE-980] If you are using nginx configs provided in `.mcloud` or `.whaler` directory please update gzip section as 
illustrated in this [commit](https://github.com/modera/foundation-standard/commit/d521dd0701ec8784be075e00ef7778ade1707dd5), 
it will reduce amount of data transferred through the network for about 80%. Also it is recommended to enable optimistic 
cache by adding `location` block, see this [commit](https://github.com/modera/foundation-standard/commit/bb9c575c97578f63e9ceecf77c1bf632ea49397c) 
for more details. Once updated do not forget to restart Nginx.

## 0.10

* Update composer.json so "modera/mjr" would point to "~0.3.0" version
* Update composer.json so it would include [modera/foundation](https://github.com/modera/foundation) and exclude
 packages that modera/foundation "replaces" (see ["replace"](https://github.com/modera/foundation/blob/master/composer.json#L34) 
 section of modera/foundation package).
* Update .whaler and .mcloud directories so they would use latest configuration files. See 
[5a7b6b5 changeset](https://github.com/modera/foundation-standard/commit/0a20324cb480dc7b18f6727ea9779a75177ce388) for 
related changeset. Updated configuration files make it easier to install additional application to the platform (such as chat).

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