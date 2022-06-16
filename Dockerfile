FROM ubuntu:xenial as downloader

RUN apt-get update \
    && apt-get upgrade -q -y \
    && apt-get dist-upgrade -q -y \
    && apt-get install -q -y wget curl \
    && apt-get clean \
    && cd /tmp \
    && wget https://www.multichain.com/download/multichain-2.2.1.tar.gz \
    && tar -xvzf multichain-2.2.1.tar.gz -C /tmp \
    && rm -rf multichain-2.2.1.tar.gz

FROM --platform="linux/amd64" alpine:3.16
COPY --from=downloader /tmp/multichain* /usr/bin/