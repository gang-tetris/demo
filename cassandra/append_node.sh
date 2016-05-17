NUMBER=$1
MASTER=$2

SEED_PROVIDER=$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ${MASTER})
docker run -d --name "cassandra$NUMBER" -e CASSANDRA_SEEDS="${SEED_PROVIDER}" \
       gangtetris/cassandra:2.2

until docker exec "cassandra${NUMBER}" cqlsh -e quit
do
    sleep 1
done

