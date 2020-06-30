[![](https://img.shields.io/docker/cloud/build/taivokasper/omnidb.svg)](https://cloud.docker.com/repository/docker/taivokasper/omnidb/general "Build")
[![](https://images.microbadger.com/badges/version/taivokasper/omnidb.svg)](https://hub.docker.com/r/taivokasper/omnidb/tags "Latest version")
[![Docker Pulls](https://img.shields.io/docker/pulls/taivokasper/omnidb)](https://hub.docker.com/r/taivokasper/omnidb "Image info")
[![](https://images.microbadger.com/badges/image/taivokasper/omnidb.svg)](https://hub.docker.com/r/taivokasper/omnidb "Image info")

# docker-omnidb
Minimal [Alpine linux](https://hub.docker.com/_/alpine/) based [Docker](https://www.docker.com/) container running [OmniDB](https://www.omnidb.org/en/) for easy database management via web interface.

## Running

* Without volume mapping
    ```bash
    docker run -it --rm -p 127.0.0.1:8080:8080 -p 127.0.0.1:25482:25482 taivokasper/omnidb
    ```
* Using volume for configuration persistence
    ```bash
    docker run -it --rm -v config-omnidb:/etc/omnidb -p 127.0.0.1:8080:8080 -p 127.0.0.1:25482:25482 taivokasper/omnidb
    ```

### Port usage

| Port | Usage |
| ---- | ----- |
| 8080 | HTTP  |
| 25482 | Websocket |

### Configuration persistence

Configuration is stored in `/etc/omnidb`

## Login
Default login username: "admin" and password "admin".

## Docker Hub
Available for pulling from [Docker Hub](https://hub.docker.com/r/taivokasper/omnidb/).
