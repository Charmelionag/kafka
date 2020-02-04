#!/bin/bash
source /root/.bashrc

/root/kafka/bin/zookeeper-server-start.sh /root/kafka/config/zookeeper.properties &
/root/kafka/bin/kafka-server-start.sh /root/kafka/config/server.properties
