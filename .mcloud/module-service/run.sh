#!/bin/bash

echo ""
echo "#################################################################################################################"
echo "Running module service: $(date +"%d.%m.%Y %r")"
echo ""

MY_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $MY_PATH

if [[ ! -d app ]]; then

    composer create-project --no-interaction modera/module-service app/ 1.0.*

fi

@me ready in 3s
app/console modera:module:client --working-dir=/var/www --path-prefix=/module-service $@
