#!/bin/bash


ARGS="--wsrep-cluster-name=$POD_SERVICE_NAME --wsrep-node-address=$POD_IP"

if [ -n $(dig +short +search galera) ]
then
  /docker-entrypoint.sh mysqld $ARGS --wsrep-cluster-address=gcomm://`dig +short +search $POD_SERVICE_NAME | tr '\n' ','`
else
  /docker-entrypoint.sh mysqld $ARGS --wsrep-new-cluster
fi
