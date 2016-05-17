NUMBER=${1:-}

docker run -d \
    --name repository${NUMBER} -h repository${NUMBER} \
    --link cassandra:cassandra --link hazelcast:hazelcast \
    --link rabbit:rabbit${NUMBER} \
    gangtetris/test-cassandra-repository

