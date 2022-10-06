#!/bin/bash

sleep 2

influx setup \
    --host http://influxdb:8086 \
    --username admin \
    --password "Admin123!@#" \
    --org "Seems Cloud" \
    --bucket "Observability Platform" \
    --retention 0 \
    --force \
    --hide-headers

influx bucket create \
    --name "Telegraf" \
    --hide-headers

BUCKET_ID=`influx bucket list | grep "Telegraf" | awk '{print $1}'`
ORG_ID=`influx organization list | grep "Seems Cloud" | awk '{print $1}'`

influx user create \
    --org-id "${ORG_ID}" \
    --name "telegraf-offloader" \
    --password "Admin123!@#" \
    --hide-headers

influx auth create \
    --org "Seems Cloud" \
    --user "telegraf-offloader" \
    --description "Telegraf" \
    --write-bucket "${BUCKET_ID}" \
    --read-bucket "${BUCKET_ID}" \
    --hide-headers

TOKEN_ID=`influx auth list | grep "Telegraf" | awk '{print $3}'`

echo "Token: ${TOKEN_ID}"