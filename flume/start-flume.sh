#!/usr/bin/env bash

export JAVA_HOME=/usr/lib/jvm/java-8-oracle
echo JAVA_HOME=${JAVA_HOME}

./bin/flume-ng agent --name flafka-agent1 --conf conf --conf-file ./conf/flume.conf