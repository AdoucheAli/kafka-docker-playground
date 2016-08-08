FROM wurstmeister/base

MAINTAINER baseman

# zookeeper
RUN wget -q -O - http://mirror.vorboss.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt
RUN mv /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV ZK_HOME /opt/zookeeper-3.4.6
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh
WORKDIR /opt/zookeeper-3.4.6
VOLUME ["/opt/zookeeper-3.4.6/conf", "/opt/zookeeper-3.4.6/data"]

# nagios cfg
#RUN apt-get update \
#	&& apt-get install -q -y supervisor nagios-nrpe-server nagios-plugins \
#    && apt-get clean \
#    && rm -rf /var/lib/apt /tmp/* /var/tmp/*
#
#ENV NAGIOS_CONF_DIR /etc/nagios
#ENV NAGIOS_PLUGINS_DIR /usr/lib/nagios/plugins
#
#RUN sed -e 's/^allowed_hosts=/#allowed_hosts=127.0.0.1/' -i $NAGIOS_CONF_DIR/nrpe.cfg \
#    && echo "command[check_load]=$NAGIOS_PLUGINS_DIR/check_load -w 15,10,5 -c 30,25,20" > $NAGIOS_CONF_DIR/nrpe.d/load.cfg \
#    && echo "command[check_mem]=$NAGIOS_PLUGINS_DIR/check_mem -f -C -w 12 -c 10 " > $NAGIOS_CONF_DIR/nrpe.d/mem.cfg \
#    && echo "command[check_total_procs]=/usr/lib/nagios/plugins/check_procs -w 500 -c 700 " > $NAGIOS_CONF_DIR/nrpe.d/procs.cfg
#
#RUN wget -o /usr/local/bin/dumb-init -L https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64 && \
#   chmod +x /usr/local/bin/dumb-init
#
#ADD start-nrpe.sh /usr/sbin/start-nrpe.sh
#RUN chmod +x /usr/sbin/start-nrpe.sh
#
#ADD plugins $NAGIOS_PLUGINS_DIR
#RUN chmod +x -R  $NAGIOS_PLUGINS_DIR
#
#ADD nrpe.d $NAGIOS_CONF_DIR/nrpe.d

# network binding
#EXPOSE 2181 2888 3888 5666
EXPOSE 2181 2888 3888

# start
#CMD /usr/local/bin/dumb-init /usr/sbin/start-nrpe.sh && /usr/sbin/sshd && start-zk.sh
CMD /usr/sbin/sshd && start-zk.sh