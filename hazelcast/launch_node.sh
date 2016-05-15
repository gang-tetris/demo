MASTER=${1:-hazelcast}
NODE_NAME=""

[[ ! -z "$2" ]] && NODE_NAME="--name $2"

docker run -d ${NODE_NAME} --link ${MASTER}:${MASTER} \
           gangtetris/hazelcast:3.6

