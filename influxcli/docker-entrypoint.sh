#!/bin/bash

influx setup \
    --host http://influxdb:8086 \
    --username admin \
    --password "Admin123!@#" \
    --org SeemsCloud \
    --bucket Observability \
    --retention 0 \
    --force