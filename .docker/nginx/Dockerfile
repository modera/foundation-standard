FROM nginx:1.20

COPY ./ /.nginx

RUN \
\
    rm /etc/nginx/nginx.conf && \
    ln -s /.nginx/nginx.conf /etc/nginx/nginx.conf

VOLUME ["/etc/nginx/conf.d", "/etc/nginx/ssl"]

WORKDIR /usr/src/app

CMD ["nginx"]
