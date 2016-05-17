#!/bin/bash

for i in test-amqp-client test-amqp-server test-cassandra-repository haproxy:1.6
do
    docker pull "gangtetris/$i"
done

