#!/bin/bash


ARGS="--wsrep-cluster-name=$POD_SERVICE_NAME --wsrep-node-address=$POD_IP"

if [ $(dig +short +search galera | wc -l) = 1 ]
then
  mysqld $ARGS --wsrep-new-cluster
else
  mysqld $ARGS --wsrep-cluster-address=gcomm://`dig +short +search $POD_SERVICE_NAME | tr '\n' ','`
fi
