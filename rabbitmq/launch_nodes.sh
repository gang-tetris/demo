#!/bin/bash

set -e

NODES=${1:-1}
MASTER=${2:-rabbit}
COOKIE=${3:-cookie}

for i in $(seq $NODES)
do
    bash append_node.sh $i $COOKIE $MASTER
done

exit 0

