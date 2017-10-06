FROM ubuntu:14.04
MAINTAINER eric@lubow.org

RUN apt-get update && \
    apt-get install -y python curl && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN curl -sSL -o /cassandra.tar.gz http://apache.claz.org/cassandra/3.0.14/http://apache.claz.org/cassandra/3.0.14/apache-cassandra-3.0.14-bin.tar.gz && \
    tar -xvf cassandra.tar.gz && \
    mv apache-cassandra-3.0.14 cassandra && \
    rm /cassandra.tar.gz

ENTRYPOINT ["/cassandra/bin/cqlsh"]
