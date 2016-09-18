FROM hypriot/rpi-alpine-scratch:v3.4

# install postgresql and bash (bash is necessary for docker-entrypoint.sh script)
RUN apk add --no-cache postgresql==9.5.4-r0 bash

RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

ENV LANG en_US.utf8

RUN mkdir /docker-entrypoint-initdb.d

ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432

CMD ["postgres"]
