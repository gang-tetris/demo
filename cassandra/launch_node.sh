MASTER=${1:-cassandra}
NODE_NAME=""

[[ ! -z "$2" ]] && NODE_NAME="--name $2"

SEED_PROVIDER=$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ${MASTER})
docker run -d ${NODE_NAME} -e CASSANDRA_SEEDS="${SEED_PROVIDER}" \
       gangtetris/cassandra:2.2

