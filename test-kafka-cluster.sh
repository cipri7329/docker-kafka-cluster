#!/bin/bash

# we can create topics with replication-factor 3 now!
#bin/kafka-topics.sh --zookeeper zookeeper1:2181,zookeeper2:2181,zookeeper3:2181/kafka --create --topic second_topic --replication-factor 3 --partitions 3

# we can publish data to Kafka using the bootstrap server list!
#bin/kafka-console-producer.sh --broker-list kafka1:9092,kafka2:9092,kafka3:9092 --topic second_topic

# we can read data using any broker too!
bin/kafka-console-consumer.sh --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 --topic second_topic --from-beginning

# we can create topics with replication-factor 3 now!
#bin/kafka-topics.sh --zookeeper zookeeper1:2181,zookeeper2:2181,zookeeper3:2181/kafka --create --topic third_topic --replication-factor 3 --partitions 3

# let's list topics
bin/kafka-topics.sh --zookeeper zoo1:2181,zoo2:2181,zoo3:2181/kafka --list
kafka-topics --zookeeper localhost:2191,localhost:2192,localhost:2193/kafka --list

kafka-topics --zookeeper localhost:2193/kafka --list

# publish some data
bin/kafka-console-producer.sh --broker-list kafka1:9092,kafka2:9092,kafka3:9092 --topic third_topic
kafka-console-producer --broker-list localhost:9094,localhost:9095,localhost:9096 --topic topic1

# we can read data using any broker too!
bin/kafka-console-consumer.sh --bootstrap-server localhost:9094,localhost:9095,localhost:9096 --topic topic1 --from-beginning
kafka-console-consumer.sh --bootstrap-server localhost:9094,localhost:9095,localhost:9096 --topic topic1 --from-beginning
kafka-console-consumer --bootstrap-server 172.18.0.11:9094,172.18.0.12:9095,172.18.0.10:9096 --topic topic1 --from-beginning

kafka-console-consumer --bootstrap-server 127.0.0.1:9096 --topic topic1 --from-beginning


# let's delete that topic
bin/kafka-topics.sh --zookeeper zookeeper1:2181,zookeeper2:2181,zookeeper3:2181/kafka --delete --topic third_topic

# it should be deleted shortly:
bin/kafka-topics.sh --zookeeper zookeeper1:2181,zookeeper2:2181,zookeeper3:2181/kafka --list
