for d in $(docker ps -q); do docker stop $d & done
for d in $(docker ps -qa); do docker rm $d & done

