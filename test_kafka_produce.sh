#!/usr/bin/env bash

ZK=localhost:2181
KAFKA_HOME=/opt/kafka/active

${KAFKA_HOME}/bin/kafka-topics.sh --create --topic test \
--partitions 4 --zookeeper ${ZK} --replication-factor 2

${KAFKA_HOME}/bin/kafka-topics.sh --describe --topic test --zookeeper ${ZK}

${KAFKA_HOME}/bin/kafka-console-producer.sh --topic=test \
--broker-list=`broker-list.sh`