FROM ubuntu
LABEL maintainer="Carlos Nunez <dev@carlosnunez.me>"

USER root
COPY ./web-server.bash /

RUN chmod 755 /web-server.bash
RUN apt-get update \
    && apt-get install -y --no-install-recommends bash netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

USER nobody

ENTRYPOINT [ "/web-server.bash" ]
