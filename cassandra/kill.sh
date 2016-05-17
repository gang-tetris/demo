#!/bin/bash

NODES=${1:-1}

for i in $(seq $NODES)
do
    docker stop "cassandra$i" && docker rm "cassandra$i"
done
wait

exit 0

