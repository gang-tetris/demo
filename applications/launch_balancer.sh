PORT=${PORT:-8080}
SERVERS=""
LINKS=""

for s in $@
do
    LINKS="$LINKS --link $s:$s"
    SERVERS="$SERVERS $s"
done

docker run -d --name haproxy ${LINKS} -e SERVERS="$SERVERS" -h persons -p $PORT:80 gangtetris/haproxy:1.6

