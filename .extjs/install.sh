#!/bin/bash

MY_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[
    ! -d "$MY_PATH/../web/extjs"
]]; then

    if [[
        ! -e "$MY_PATH/ext-4.2.1-gpl.tar.gz"
    ]]; then

        echo "--------------------------------------------------"
        echo "    Downloading ExtJS 4.2.1"
        echo "--------------------------------------------------"

        wget --no-check-certificate https://extjs.modera.org/ext-4.2.1-gpl.tar.gz -O "$MY_PATH/ext-4.2.1-gpl.tar.gz"

    fi

    echo "--------------------------------------------------"
    echo "    Installing ExtJS 4.2.1"
    echo "--------------------------------------------------"

    tar --totals -xzf "$MY_PATH/ext-4.2.1-gpl.tar.gz" -C "$MY_PATH/../web"
    mv "$MY_PATH/../web/ext-4.2.1.883" "$MY_PATH/../web/extjs"
    echo ""

else

    echo "--------------------------------------------------"
    echo "    ExtJS 4.2.1 already installed"
    echo "--------------------------------------------------"

fi