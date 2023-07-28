FROM debian:bookworm-slim

ARG IVENTOY_VERSION=1.0.17

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl libglib2.0-dev libevent-dev libwim-dev supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    curl -kL https://github.com/ventoy/PXE/releases/download/v${IVENTOY_VERSION}/iventoy-${IVENTOY_VERSION}-linux-free.tar.gz -o /tmp/iventoy.tar.gz && \
    tar -zxvf /tmp/iventoy.tar.gz -C / && \
    mv /iventoy-${IVENTOY_VERSION} /iventoy-bs

COPY config/supervisord.conf /etc/supervisor/supervisord.conf
COPY scripts/init.sh /init.sh

ENTRYPOINT [ "/init.sh" ]
CMD [ "/usr/bin/supervisord" ]
