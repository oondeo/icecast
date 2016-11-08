FROM oondeo/alpine
MAINTAINER info@oondeo.es

RUN addgroup -S icecast && \
    adduser -S icecast
    
RUN apk add --update \
        icecast \
        mailcap && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]
    
ENTRYPOINT ["/sbin/tini", "-g","--", "/entrypoint.sh"]    
