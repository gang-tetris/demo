NUMBER=${1:-}

docker run -d \
    --name rest${NUMBER} -h rest${NUMBER} \
    --link rabbit:rabbit${NUMBER} \
    gangtetris/test-amqp-client

