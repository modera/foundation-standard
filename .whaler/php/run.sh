#!/bin/bash

echo ""
echo "##################################################"
echo ""
echo "Running APP: $(date +"%d.%m.%Y %r")"
echo ""
echo "##################################################"
echo ""

echo "Waiting while mysql starts"
while ! echo exit | nc -z mysql 3306; do
    echo ".";
    sleep 3;
done
echo ""

# make some dev stuff
if [ -f ./composer.json ]; then
   rm -rf ./var/*
   composer install --no-interaction
fi

echo ""
echo "##################################################"
echo ""
echo "APP Started: $(date +"%d.%m.%Y %r")"
echo ""
echo "##################################################"

@whaler wait 5s

/.php/configure.sh
php8-fpm -R
