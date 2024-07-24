FROM nginx:mainline-alpine

VOLUME /var/www/html

RUN apk add --no-cache --update \
  apache2-utils \
  && rm -f /etc/nginx/conf.d/*

ENV PORT=8123
ENV CLIENT_MAX_BODY_SIZE=1m
ENV WORKER_PROCESSES=auto
ENV BASIC_AUTH_USERNAME=username
ENV BASIC_AUTH_PASSWORD=password

WORKDIR /

COPY run.sh /
RUN chmod +x /run.sh
COPY src/ /var/www/html
COPY nginx-basic-auth.conf /

STOPSIGNAL SIGQUIT

ENTRYPOINT ["/run.sh"]