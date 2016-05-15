#!/bin/bash

set -e

NUMBER=$1
COOKIE=$2
MASTER=$3

NAME="rabbit${NUMBER}"

LINKS="--link ${MASTER}:${MASTER}"
for i in $(seq $((NUMBER-1)))
do
    LINKS="$LINKS --link rabbit${i}:rabbit${i}"
done

docker run -d $LINKS --name "${NAME}" -h "${NAME}" \
           -e RABBITMQ_ERLANG_COOKIE="${COOKIE}" \
           -e RABBITMQ_NODENAME="rabbit@${NAME}" \
           rabbitmq:3

docker cp join_cluster.sh "${NAME}:/tmp/join_cluster.sh" #>/dev/null

until docker exec "${NAME}" rabbitmqctl status #>/dev/null
do
    sleep 1
done

docker exec "${NAME}" bash /tmp/join_cluster.sh ${MASTER} #>/dev/null

exit 0

