FROM debian

MAINTAINER Taivo Käsper <taivo.kasper@gmail.com>

ENV OMNIDB_VERSION 1.5

RUN apt-get update && apt-get install -y mono-complete mono-xsp4 curl unzip
RUN curl -Lo /tmp/OmniDB.zip https://github.com/OmniDB/OmniDB/releases/download/v${OMNIDB_VERSION}/OmniDB-${OMNIDB_VERSION}.zip
RUN unzip /tmp/OmniDB.zip -d /opt/
RUN rm -f /tmp/OmniDB.zip

# Cleanup
RUN apt-get remove -y curl unzip

EXPOSE 8080

WORKDIR /opt/OmniDB-${OMNIDB_VERSION}

CMD xsp4 --port 8080
