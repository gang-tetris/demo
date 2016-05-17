PORT=${PORT:-8080}
HOSTNAME=${HOSTNAME:-haproxy}
SERVERS=""
LINKS=""

for s in $@
do
    LINKS="$LINKS --link $s:$s"
    SERVERS="$SERVERS $s"
done

docker run -d --name ${HOSTNAME} ${LINKS} -e SERVERS="$SERVERS" -h ${HOSTNAME} -p $PORT:80 gangtetris/haproxy:1.6

