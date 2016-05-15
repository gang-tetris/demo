#!/bin/bash

set -e

NODES=${1:-1}
COOKIE=${2:-cookie}
MASTER=${3:-rabbit}

for i in $(seq $NODES)
do
    bash append_node.sh $i $COOKIE $MASTER
done

exit 0

