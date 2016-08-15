#!/usr/bin/env bash

ZK=localhost:2181
KAFKA_HOME=/opt/kafka/active

${KAFKA_HOME}/bin/kafka-console-consumer.sh --topic=test --zookeeper=${ZK}