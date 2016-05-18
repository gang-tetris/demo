PORT=${PORT:-8080}
HOST=${HOST:-haproxy}
SERVERS=""
LINKS=""

for s in $@
do
    LINKS="$LINKS --link $s:$s"
    SERVERS="$SERVERS $s"
done

docker run -d --name ${HOST} ${LINKS} -e SERVERS="$SERVERS" -h ${HOST} -p $PORT:80 gangtetris/haproxy:1.6

