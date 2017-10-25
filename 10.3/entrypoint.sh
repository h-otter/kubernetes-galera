#!/bin/bash


ARGS="--wsrep-cluster-name=$POD_SERVICE_NAME --wsrep-node-address=$POD_IP"

/docker-entrypoint.sh mysqld $ARGS --wsrep-cluster-address=gcomm://`dig +short +search $POD_SERVICE_NAME | grep -v $POD_IP | paste -s -d ',' -`
