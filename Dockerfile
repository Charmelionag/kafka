FROM ubuntu
MAINTAINER Muradu Iurie "muradu.iurie.1986@gmail.com"

RUN apt update && apt install openjdk-8-jdk vim -y
RUN mkdir /root/kafka
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
WORKDIR /root
COPY kafka_bin kafka
COPY deploy.sh /root/kafka/bin
RUN echo "\nexport PATH=$PATH:/root/kafka/bin" >> .bashrc 
#RUN /bin/bash -c "source /root/.bashrc"
RUN mkdir -p kafka/data/zookeeper && mkdir kafka/data/kafka
WORKDIR /root/kafka
RUN sed -i '/dataDir/c\dataDir=\/root\/kafka\/data\/zookeeper' config/zookeeper.properties
RUN sed -i '/log.dirs/c\log.dirs=\/root\/kafka\/data\/kafka' config/server.properties

EXPOSE 2181

#CMD /root/kafka/bin/zookeeper-server-start.sh /root/kafka/config/zookeeper.properties
CMD /root/kafka/bin/deploy.sh
