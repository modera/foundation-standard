# Modera Foundation

RAD platform for developing applications using Symfony, Doctrine, ExtJS ([MJR](https://mjr.modera.org/)).

![Settings](app/Resources/screenshots/login.png)

## Installation

If you are working under Debian-like operating system (like Ubuntu):

* Install [whaler](https://github.com/whaler/whaler)
* Install [whaler-haproxy-plugin](https://github.com/whaler/whaler-haproxy-plugin)
* Optional. If you want to make sure that you won't reach github API call limit for anonymous users when composer is working you can add [GitHub personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line):

```bash
$ whaler vars:set COMPOSER_GITHUB_OAUTH YOUR-TOKEN-HASH-GOES-HERE
```

* Go to directory where you cloned this repository and execute these commands:

```bash
$ whaler start --init
$ whaler run php. 'bin/console modera:security:create-user'
```

## Manual installation

* Install a composer, please read instructions at https://getcomposer.org/download/
* Go to directory where you cloned this repository and execute these commands:

```bash
$ composer install
$ bin/console modera:security:create-user
```

### P.S Don't forget check folders permissions, in case you may get an error on some files

If you are running unix-like operating system, then you need to make `var/cache` and `var/logs` directories writable by both you and a web-server you are going to run Modera Foundation from. If your system supports `chmod +a` you can use this:

``` bash
$ rm -rf var/cache/*
$ rm -rf var/logs/*
$ HTTPDUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
$ sudo chmod +a "$HTTPDUSER allow delete,write,append,file_inherit,directory_inherit" var/cache var/logs app/kernel.json
$ sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" var/cache var/logs
```

If executing these commands give you an error then try this:

``` bash  
$ HTTPDUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
$ sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX var/cache var/logs app/kernel.json
$ sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX var/cache var/logs
```

In case you OS doesn't support `setfacl` either, you can use set chmod 777:

``` bash
$ chmod 777 var/logs var/cache app/kernel.json
```

DO NOT ever use 777 mode on production servers, because it makes it possible for all scripts running on the same machine write to these directories, this could be a pretty huge security vulnerability if somebody exposes it.
