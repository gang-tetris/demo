NODE_NUMBER=${1:-}
MASTER=${2:-hazelcast}

docker run -d \
    --name hazelcast$NODE_NUMBER -h hazelcast$NODE_NUMBER \
    --link ${MASTER}:${MASTER} \
    gangtetris/hazelcast:3.6

