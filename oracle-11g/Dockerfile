FROM oraclelinux

ADD downloads/linux.x64_11gR2_database_1of2.zip /tmp/
ADD downloads/linux.x64_11gR2_database_2of2.zip /tmp/

ADD install /install

RUN groupadd dba && useradd -m -G dba oracle && mkdir /u01 && chown oracle:dba /u01
RUN yum install -y yum install oracle-rdbms-server-11gR2-preinstall glibc-static wget unzip && yum clean all

#Delete limits cause of docker limits issue
RUN cat /etc/security/limits.conf | grep -v oracle | tee /etc/security/limits.conf

WORKDIR /tmp

RUN unzip -q linux.x64_11gR2_database_1of2.zip
RUN unzip -q linux.x64_11gR2_database_2of2.zip

RUN rm -f linux*.zip

RUN mv database /home/oracle/

RUN su oracle -c 'cd /home/oracle/database && ./runInstaller -ignorePrereq -ignoreSysPrereqs -silent -responseFile /install/oracle-11g-ee.rsp -waitForCompletion 2>&1'

RUN rm -rf /home/oracle/database

RUN mv /u01/app/oracle/product /u01/app/oracle-product
