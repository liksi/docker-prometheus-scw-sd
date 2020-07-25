FROM debian:buster-slim

LABEL "maintainer"="Liksi <ops@liksi.fr>"

ARG PROM_SCW_SD_RELEASE=v2.0
ARG PROM_SCW_SD_VERSION=2.0.0

RUN mkdir /work

RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://github.com/scaleway/prometheus-scw-sd/releases/download/${PROM_SCW_SD_RELEASE}/prometheus-scw-sd-${PROM_SCW_SD_VERSION}.linux-amd64.tar.gz \
    && tar xvzf prometheus-scw-sd-${PROM_SCW_SD_VERSION}.linux-amd64.tar.gz \
    && chmod +x ./linux-amd64/prometheus-scw-sd \
    && mv ./linux-amd64/prometheus-scw-sd /usr/local/bin/prometheus-scw-sd \
    && rm prometheus-scw-sd-${PROM_SCW_SD_VERSION}.linux-amd64.tar.gz

WORKDIR /work
VOLUME /work

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
