#!/bin/bash

echo "wsrep_cluster_name=$POD_SERVICE_NAME" >> /etc/mysql/conf.d/generated_cluster.cnf
echo "wsrep_cluster_address=gcomm://`dig +short +search galera | tr '\n' ','`" >> /etc/mysql/conf.d/generated_cluster.cnf
echo "wsrep_node_address=$POD_IP" >> /etc/mysql/conf.d/generated_cluster.cnf

if [ $(dig +short +search galera | wc -l) = 1 ]
then
  mysqld --wsrep-new-cluster
else
  mysqld
fi
