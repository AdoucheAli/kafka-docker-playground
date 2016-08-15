#!/bin/bash

HOST_IP=$1
if [ -z "$HOST_IP" ];
  then HOST_IP=$(hostname -I | awk '{ print $1 }');
fi

ZK=$2
if [ -z "$ZK" ];
  then ZK=${HOST_IP}:2181;
fi

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e HOST_IP=${HOST_IP} -e ZK=${ZK} -i -t baseman/kafka /bin/bash