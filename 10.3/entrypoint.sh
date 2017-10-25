#!/bin/bash


ARGS="--wsrep-cluster-name=$POD_SERVICE_NAME --wsrep-node-address=$POD_IP"

if [ -z $(dig +short +search $POD_SERVICE_NAME | grep $POD_IP) ]
then
  /docker-entrypoint.sh mysqld $ARGS --wsrep-new-cluster
else
  /docker-entrypoint.sh mysqld $ARGS --wsrep-cluster-address=gcomm://`dig +short +search $POD_SERVICE_NAME | tr '\n' ','`
fi
