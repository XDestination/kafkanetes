FROM centos
RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && yum -y install java-1.8.0-openjdk-headless tar \
  && curl -s http://www.mirrorservice.org/sites/ftp.apache.org/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz | tar -xz --strip-components=1 \
  && yum clean all
COPY zookeeper-server-start-multiple.sh /opt/kafka/bin/
COPY kafka-start.sh /opt/kafka/bin/
COPY kafka.server.config.template /opt/kafka/config/
RUN chmod -R a=u /opt/kafka
WORKDIR /opt/kafka
EXPOSE 2181 2888 3888 9092
