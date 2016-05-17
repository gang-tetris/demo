#!/bin/bash

set -e

NODES=${1:-1}
MASTER=${2:-cassandra}

until docker exec "${MASTER}" cqlsh -e quit
do
    sleep 1
done

for i in $(seq $NODES)
do
    bash append_node.sh $i $MASTER
done

exit 0

