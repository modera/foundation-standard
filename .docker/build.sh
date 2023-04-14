#!/bin/bash

set -e

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
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

build_base_image() {
    NAME=$1
    FILE=$2
    CONTEXT=`dirname $FILE`
    docker build --pull --rm -f ${FILE} -t ${IMAGE_PREFIX}_${NAME}:latest ${CONTEXT}
}

build_base_image mysql ${SCRIPT_DIR}/mysql/Dockerfile
build_base_image php ${SCRIPT_DIR}/php/Dockerfile
build_base_image nginx ${SCRIPT_DIR}/nginx/Dockerfile
