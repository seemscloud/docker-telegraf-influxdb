#!/bin/bash

telegraf \
    --config telegraf.conf \
    --config-directory telegraf.d \
    --pidfile telegraf.pid