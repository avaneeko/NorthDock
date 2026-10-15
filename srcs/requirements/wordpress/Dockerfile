FROM alpine:20260805

RUN apk add --no-cache \
        ca-certificates \
        curl \
        tar \
        mariadb-client \
        php84 \
        php84-fpm \
        php84-mysqli \
        php84-pdo_mysql \
        php84-curl \
        php84-gd \
        php84-intl \
        php84-mbstring \
        php84-dom \
        php84-xml \
        php84-simplexml \
        php84-xmlreader \
        php84-xmlwriter \
        php84-zip \
        php84-openssl \
        php84-session \
        php84-ctype \
        php84-fileinfo \
        php84-tokenizer \
        php84-iconv \
        php84-phar

# Create symlinks for generic PHP executable names, because PHP in alpine is versioned.
RUN ln -sf /usr/bin/php84 /usr/bin/php && \
    ln -sf /usr/sbin/php-fpm84 /usr/sbin/php-fpm

COPY ./tools/DownloadWordpress.sh /tmp/
COPY ./tools/StartWordpress.sh /tmp/

RUN /bin/ash /tmp/DownloadWordpress.sh

EXPOSE 9000

CMD [ "/bin/ash", "/tmp/StartWordpress.sh" ]