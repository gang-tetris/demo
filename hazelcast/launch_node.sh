MASTER=${2:-hazelcast}
NODE_NAME=""

[[ ! -z "$1" ]] && NODE_NAME="--name $1"

docker run -d ${NODE_NAME} --link ${MASTER}:${MASTER} \
           gangtetris/hazelcast:3.6

