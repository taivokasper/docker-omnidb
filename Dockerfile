FROM debian

MAINTAINER Taivo Käsper <taivo.kasper@gmail.com>

RUN apt-get update && apt-get install -y mono-complete mono-xsp4 curl unzip
RUN curl -o /tmp/OmniDB.zip http://www.omnidb.com.br/OmniDB-1.3.zip
RUN unzip /tmp/OmniDB.zip -d /opt/
RUN rm -f /tmp/OmniDB.zip

# Cleanup
RUN rm -f /tmp/OmniDB.zip && apt-get remove -y curl unzip

EXPOSE 8080

WORKDIR /opt/OmniDB-1.3

CMD xsp4 --port 8080
