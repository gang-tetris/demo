#!/bin/bash

set -e

COOKIE=${1:-cookie}
MASTER=${2:-rabbit}

docker run -d --name ${MASTER} -h ${MASTER} \
           -e RABBITMQ_ERLANG_COOKIE="${COOKIE}" rabbitmq:3

