FROM modera/php:8

WORKDIR /usr/src/app

COPY configure.sh /.php/configure.sh
COPY run.sh /.php/run.sh

RUN \
    # fatal: detected dubious ownership in repository
    git config --global --add safe.directory '*'

CMD ["/.php/run.sh"]
