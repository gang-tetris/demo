NUMBER=${1:-}

docker run -d --restart=unless-stopped \
    --name logic${NUMBER} -h logic${NUMBER} \
    --link rabbit:rabbit${NUMBER} \
    gangtetris/test-amqp-server

