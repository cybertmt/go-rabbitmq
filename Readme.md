docker run -it --rm --net rabbits -e RABBIT_HOST=rabbit-1 -e RABBIT_PORT=5672 -e RABBIT_USERNAME=guest -e RABBIT_PASSWORD=guest -p 8011:8011 publisher:develop

docker run -it --rm --net rabbits -e RABBIT_HOST=rabbit-1 -e RABBIT_PORT=5672 -e RABBIT_USERNAME=guest -e RABBIT_PASSWORD=guest consumer:develop

docker network create rabbits
docker network ls
docker run -d --rm --net rabbits --hostname rabbit-1 --name rabbit-1 rabbitmq:3.8
docker exec -it rabbit-1 cat /var/lib/rabbitmq/.erlang.cookie
docker rm -f rabbit-1
docker run -d --rm --net rabbits -p 15672:15672 -e RABBITMQ_ERLANG_COOKIE=YCNLFGRHDQRIWTIZMHHS --hostname rabbit-1 --name rabbit-1 rabbitmq:3.8-management

docker exec -it rabbit-1 bash
rabbitmq-plugins enable rabbitmq_management

10.22.22.32:15672/#/queues/%2F/publisher

POST 10.22.22.32:8011/publish/thanks!