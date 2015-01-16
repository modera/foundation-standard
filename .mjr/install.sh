#!/bin/bash

MY_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir "$MY_PATH/../web/modera" -p

if [[
    ! -d "$MY_PATH/../web/modera/mjr"
]]; then

    if [[
        ! -e "$MY_PATH/mjr.tar.gz"
    ]]; then

        echo "--------------------------------------------------"
        echo "    Downloading MJR"
        echo "--------------------------------------------------"

        wget --no-check-certificate https://mjr.dev.modera.org/releases/mjr.tar.gz -O "$MY_PATH/mjr.tar.gz"

    fi

    echo "--------------------------------------------------"
    echo "    Installing MJR"
    echo "--------------------------------------------------"

    mkdir "$MY_PATH/../web/modera/mjr" -p
    tar --totals -xzf "$MY_PATH/mjr.tar.gz" -C "$MY_PATH/../web/modera/mjr"
    echo ""

else

    echo "--------------------------------------------------"
    echo "    MJR already installed"
    echo "--------------------------------------------------"

fi

if [[
    ! -d "$MY_PATH/../web/modera/theme"
]]; then

    if [[
        ! -e "$MY_PATH/mjr-theme.tar.gz"
    ]]; then

        echo "--------------------------------------------------"
        echo "    Downloading MJR theme"
        echo "--------------------------------------------------"

        wget --no-check-certificate https://mjr.dev.modera.org/releases/mjr-theme.tar.gz -O "$MY_PATH/mjr-theme.tar.gz"

    fi

    echo "--------------------------------------------------"
    echo "    Installing MJR theme"
    echo "--------------------------------------------------"

    mkdir "$MY_PATH/../web/modera/theme" -p
    tar --totals -xzf "$MY_PATH/mjr-theme.tar.gz" -C "$MY_PATH/../web/modera/theme"
    echo ""

else

    echo "--------------------------------------------------"
    echo "    MJR theme already installed"
    echo "--------------------------------------------------"

fi