FROM ubuntu:focal

ARG APP_USER="telegraf"
ARG APP_UID="1000"
ARG APP_GROUP="telegraf"
ARG APP_GID="1000"
ARG APP_DIR="/app"
ARG APP_VERSION

ENV PATH="${PATH}:${APP_DIR}"

RUN groupadd -g "${APP_GID}" "${APP_GROUP}" && \
    useradd -u "${APP_UID}" -g "${APP_GID}" -d "${APP_DIR}" -m "${APP_USER}"

RUN apt-get update && \
    apt-get install wget -y

WORKDIR /tmp

RUN wget "https://dl.influxdata.com/telegraf/releases/telegraf-${APP_VERSION}.tar.gz" -O telegraf.tar.gz

RUN tar -xvf telegraf.tar.gz --strip-components=2 -C "${APP_DIR}"

WORKDIR "${APP_DIR}"

RUN rm -rf etc/logrotate.d && \
    rm -rf var && \
    mv etc/telegraf/* . && \
    rm -rf etc && \
    mv usr/bin/telegraf . && \
    rm -rf usr

COPY ./docker-entrypoint.sh .

ENTRYPOINT ["/bin/bash", "/app/docker-entrypoint.sh"]