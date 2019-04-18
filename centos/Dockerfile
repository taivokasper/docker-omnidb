FROM centos:centos7

MAINTAINER Taivo Käsper <taivo.kasper@gmail.com>

ENV OMNIDB_VERSION 2.12.0


RUN yum -y groupinstall "Development Tools" \
      && yum install -y epel-release centos-release \
      && yum -y install libffi unzip python34 python34-pip python34-devel \
      && pip3 install --upgrade pip \
      && pip3 install psycopg2 \
      && pip3 install cffi \
      && curl -Lo /tmp/OmniDB.zip https://github.com/OmniDB/OmniDB/archive/${OMNIDB_VERSION}.zip \
      && unzip /tmp/OmniDB.zip -d /opt/ \
      && rm -f /tmp/OmniDB.zip \
      && mkdir /etc/omnidb \
      && cd /opt/OmniDB-${OMNIDB_VERSION} \
      && pip3 install --upgrade pip==9.0.3 \
      && echo "Begin install cherrypy" \
      && pip3 install cherrypy \
      && echo "Begin install requirements" \
      && pip3 install -r requirements.txt \
      && yum -y groupremove "Development Tools"

#RUN apk del .build-deps \
#      && find /usr/local -name '*.a' -delete

EXPOSE 8080 25482

WORKDIR /opt/OmniDB-${OMNIDB_VERSION}/OmniDB

ENTRYPOINT ["python3", "omnidb-server.py", "--host=0.0.0.0", "--port=8080", "-d", "/etc/omnidb"]
