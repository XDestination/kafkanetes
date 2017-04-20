#!/bin/bash -e

ADVERTISED_HOST_NAME=$1
ZOOKEEPER_CONNECT=$2

cat config/kafka.server.config.template |
  sed "s/ADVERTISED_HOST_NAME/$ADVERTISED_HOST_NAME/g" |
  sed "s/ZOOKEEPER_CONNECT/$ZOOKEEPER_CONNECT/g" > config/config/server.properties

bin/kafka-server-start.sh config/server.properties
