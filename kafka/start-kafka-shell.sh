#!/bin/bash

HOST_IP=$1
if [ -z "$HOST_IP" ];
  then HOST_IP=$(hostname -I | awk '{ print $1 }');
fi

ZK=$2
ZK_PORT=:2181
if [ -z "$ZK" ];
  then ZK=${HOST_IP}${ZK_PORT};
fi

echo HOST_IP=${HOST_IP}
echo ZK=${ZK}

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e HOST_IP=${HOST_IP} -e ZK=${ZK} -i -t kafkadockerplayground_kafka /bin/bash