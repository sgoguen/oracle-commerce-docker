# oracle-commerce-docker
Building Docker for oracle commerce ATG 11.3

For Database using the already existing docker image

Refer this https://hub.docker.com/r/alexeiled/docker-oracle-xe-11g/


# Steps 

* Download Oracle JDK to the "jboss-eap" folder (./installers/jdk-8u144-linux-x64.tar)
* Download JBoss 7.0 from Red Hat to the "jboss-eap" folder (./installers/jboss-eap-7.0.0.zip)

# 

* Build JBoss Docker Image
    * Download required downloads from Oracle
        * ./installers/jdk-8u144-linux-x64.tar 
            * --> Updated to jdk-8u181-linux-x64
        * ./installers/jboss-eap-7.0.0.zip
    * Run docker build

# Before Building We're going to need to download