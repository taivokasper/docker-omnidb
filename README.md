# docker-omnidb
Minimal [Alpine linux](https://hub.docker.com/_/alpine/) based [Docker](https://www.docker.com/) container running [OmniDB](https://www.omnidb.org/en/) for easy database management through a web interface.

## Running

* Without volume mapping
    ```bash
    docker run -it --rm -p 8080:8080 -p 25482:25482 taivokasper/omnidb
    ```
* Using volume for configuration persistence
    ```bash
    docker run -it --rm -v config-omnidb:/etc/omnidb -p 8080:8080 -p 25482:25482 taivokasper/omnidb
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
