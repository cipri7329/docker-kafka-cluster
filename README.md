# docker-kafka-cluster
a kafka-cluster demonstration running on docker

using docker-compose

3 zookeeper instances
3 kafka brokers

## Zookeeper cluster

- 1 leader and 2 followers
- zookeeper version: `zookeeper:3.4.11`

### cluster start


    docker-compose up

    docker-compose up --detach

### zookeeper shell

    zookeeper-shell localhost:2191  # node 1
    zookeeper-shell localhost:2192  # node 2
    zookeeper-shell localhost:2193  # node 3

## check status

      echo "ruok" | nc localhost 2191 ; echo

- notice the `Mode: leader` or `Mode: follower` response

      echo "stat" | nc localhost 2191 ; echo
      echo "stat" | nc localhost 2192 ; echo
      echo "stat" | nc localhost 2193 ; echo

## zoonavigator

ZooNavigator is basically the CLI but with a UI

https://github.com/elkozmon/zoonavigator

- navigate to `localhost:8000`
- connection string
      zoo1:2181,zoo2:2181,zoo3:2181

## Kafka cluster
