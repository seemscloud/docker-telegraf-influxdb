FROM ubuntu:focal

ARG APP_USER="influxd"
ARG APP_UID="1000"
ARG APP_GROUP="influxd"
ARG APP_GID="1000"
ARG APP_DIR="/app"
ARG APP_VERSION

ENV PATH="${PATH}:${APP_DIR}/bin"

RUN groupadd -g "${APP_GID}" "${APP_GROUP}" && \
    useradd -u "${APP_UID}" -g "${APP_GID}" -d "${APP_DIR}" -m "${APP_USER}"

RUN apt-get update && \
    apt-get install wget curl -y

WORKDIR /tmp

RUN wget "https://dl.influxdata.com/influxdb/releases/influxdb2-${APP_VERSION}.tar.gz" -O influxdb.tar.gz && \
    tar -xvf influxdb.tar.gz --strip-components=1 -C "${APP_DIR}"

WORKDIR "${APP_DIR}"

RUN rm -f README.md LICENSE && \
    mkdir bin && \
    mv influxd bin/

RUN chown -R "${APP_USER}":"${APP_GROUP}" "${APP_DIR}"

USER "${APP_USER}"

COPY ./docker-entrypoint.sh .

ENTRYPOINT ["/bin/bash", "/app/docker-entrypoint.sh"]