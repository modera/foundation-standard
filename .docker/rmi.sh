#!/bin/bash

set -e

IMAGE_PREFIX=app

for i in "$@"; do
case $i in
    --prefix=*)
        IMAGE_PREFIX="${i#*=}"
        shift
    ;;
    *)
        # unknown option
    ;;
esac
done

remove_base_image() {
    NAME=$1
    docker rmi ${IMAGE_PREFIX}_${NAME}:latest
}

remove_base_image mysql
remove_base_image php
remove_base_image nginx
