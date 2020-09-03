FROM funpresp/alpine:3.12

ENV VARNISH_VERSION 6.4.0-r0
ENV VARNISH_SIZE 256M

COPY entry.sh /usr/local/bin/

RUN apk --no-cache --update --verbose add varnish==${VARNISH_VERSION} \
    && rm -rf /var/cache/apk/* /tmp/* \
    && chmod +x /usr/local/bin/entry.sh

WORKDIR /etc/varnish

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/entry.sh"]
