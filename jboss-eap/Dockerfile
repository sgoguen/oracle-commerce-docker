FROM oraclelinux

RUN if [ ! -d "/opt" ]; then mkdir /opt; fi
RUN if [ ! -d "/tmp" ]; then mkdir /tmp; fi
RUN if [ ! -d "/srv/jboss/config" ]; then mkdir -p /srv/jboss/config; fi

# create jboss folders
RUN mkdir -p /var/log/jboss

###############################################################################
#              Automatically download and install Oracle JDK                  #
###############################################################################
ADD $downloadSource/jboss-eap-7.0.0/jdk-8u181-linux-x64.tar.gz /opt/
ENV JAVA_HOME=/opt/jdk1.8.0_181
ENV PATH=${JAVA_HOME}/bin:${PATH}
# Unzip/untar the archive
RUN cd /opt && tar -xvf jdk-8u181-linux-x64.tar.gz
# Remove the .tar.gz file when finished
RUN rm /opt/jdk-8u181-linux-x64.tar.gz


###############################################################################
#                 Automatically download and install JBoss                    #
###############################################################################
ADD $downloadSource/jboss-eap-7.0.0/jboss-eap-7.0.0.zip /tmp/
WORKDIR /opt/
RUN yum install unzip -y
RUN unzip /tmp/jboss-eap-7.0.0.zip > /dev/null 2>&1

ENV JBOSS_HOME=/opt/jboss-eap-7.0
# Remove the .tar.gz file when finished
RUN rm /tmp/jboss-eap-7.0.0.zip

# create jboss user
RUN useradd -s /bin/bash -d ${JBOSS_HOME} jboss && chown -R jboss:jboss ${JBOSS_HOME}

# distrbute jboss standalone configuration
ADD ./config/configuration/standalone.xml ${JBOSS_HOME}/standalone/configuration/
ADD ./config/configuration/mgmt-users.properties ${JBOSS_HOME}/standalone/configuration/

# distribute scripts
RUN if [ ! -d "/opt/scripts" ]; then mkdir /opt/scripts; fi
ADD ./scripts/jboss.sh /opt/scripts/jboss.sh
RUN chmod -R u+x /opt/scripts/*.sh

# the JBOSS deployments folder is a mounted folder
RUN rm ${JBOSS_HOME}/standalone/deployments/*
VOLUME ["${JBOSS_HOME}/standalone/deployments", "/srv/jboss/config", "/var/log/jboss"]

EXPOSE 8080
EXPOSE 9990
EXPOSE 9012