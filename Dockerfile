FROM alpine:3.11

MAINTAINER Taivo Käsper <taivo.kasper@gmail.com>

ENV OMNIDB_VERSION 2.17.0

RUN apk add --no-cache --virtual .build-deps curl unzip g++ python3-dev \
      && apk add --no-cache make wget llvm \
      && apk add --no-cache --update python3 \
      && pip3 install --upgrade pip \
      && apk add postgresql-dev libffi-dev \
      && pip3 install psycopg2 \
      && pip3 install cffi \
      && curl -Lo /tmp/OmniDB.zip https://github.com/OmniDB/OmniDB/archive/${OMNIDB_VERSION}.zip \
      && unzip /tmp/OmniDB.zip -d /opt/ \
      && rm -f /tmp/OmniDB.zip \
      && mkdir /etc/omnidb \
      && cd /opt/OmniDB-${OMNIDB_VERSION} \
      && pip3 install cherrypy \
      && pip3 install -r requirements.txt \
      && apk del .build-deps \
      && find /usr/local -name '*.a' -delete \
      && addgroup -S omnidb && adduser -S omnidb -G omnidb \
      && chown -R omnidb:omnidb /opt/OmniDB-${OMNIDB_VERSION} \
      && chown -R omnidb:omnidb /etc/omnidb

USER omnidb

EXPOSE 8080 25482

WORKDIR /opt/OmniDB-${OMNIDB_VERSION}/OmniDB

ENTRYPOINT ["python3", "omnidb-server.py", "--host=0.0.0.0", "--port=8080", "-d", "/etc/omnidb"]
