MASTER=${1:-hazelcast}

docker run -d --name ${MASTER} -h ${MASTER} \
       gangtetris/hazelcast:3.6

