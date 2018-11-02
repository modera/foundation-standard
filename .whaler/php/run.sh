#!/bin/bash

echo ""
echo "#################################################################################################################"
echo "Running APP: $(date +"%d.%m.%Y %r")"
echo ""

echo "Waiting while mysql starts"
while ! echo exit | nc -z mysql 3306; do
    echo ".";
    sleep 3;
done

# If you want to have a local copy of ExtJs, you can uncomment the following line:
#/var/www/.extjs/install.sh

rm -rf /var/www/var/cache/*
rm -rf /var/www/var/logs/*

echo "--------------------------------------------------"
echo "    Installing PHP packages"
echo "--------------------------------------------------"

composer install --no-interaction --working-dir=/var/www/

for env in `printenv | grep 'SYMFONY__'`; do
    IFS== read name value <<< "$env"
    /.cravler/php-fpm-set-env.sh "$name"
done

echo ""
echo "APP Started: $(date +"%d.%m.%Y %r")"
echo "#################################################################################################################"

@whaler wait 3s
echo ""
php-fpm -R