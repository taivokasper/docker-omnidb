FROM alpine:3.9

MAINTAINER Taivo Käsper <taivo.kasper@gmail.com>

ENV OMNIDB_VERSION 2.14.0

RUN apk add --no-cache --virtual .build-deps curl unzip g++ python3-dev \
      && apk add --no-cache make wget llvm  \
      && apk add --no-cache --update python3 \
      && pip3 install --upgrade pip \
      && apk add postgresql-dev libffi-dev \
      && pip3 install psycopg2 \
      && pip3 install cffi \
      && curl -Lo /tmp/OmniDB.zip https://github.com/OmniDB/OmniDB/archive/${OMNIDB_VERSION}.zip
RUN unzip /tmp/OmniDB.zip -d /opt/
RUN rm -f /tmp/OmniDB.zip \
      && mkdir /etc/omnidb
RUN cd /opt/OmniDB-${OMNIDB_VERSION} \
      && pip3 install --upgrade pip==9.0.3 \
      && echo "Begin install cherrypy" \
      && pip3 install cherrypy \
      && echo "Begin install requirements" \
      && pip3 install -r requirements.txt

RUN apk del .build-deps \
      && find /usr/local -name '*.a' -delete

EXPOSE 8080 25482

WORKDIR /opt/OmniDB-${OMNIDB_VERSION}/OmniDB

ENTRYPOINT ["python3", "omnidb-server.py", "--host=0.0.0.0", "--port=8080", "-d", "/etc/omnidb"]
