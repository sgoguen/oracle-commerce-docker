# Testing

You can test the JBoss setup by running the test.sh file at the command prompt:

    > sh test.sh
    staring JBOSS
    =========================================================================

    JBoss Bootstrap Environment

    JBOSS_HOME: /opt/jboss-eap-7.0

    JAVA: /opt/jdk1.8.0_181/bin/java

    JAVA_OPTS:  -server -verbose:gc -Xloggc:"/var/log/jboss/gc.log" -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=3M -XX:-TraceClassUnloading -Xms1303m -Xmx1303m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true


This runs the docker command:

    > docker run -p 127.0.0.1:9990:9990 atg-11.3 sh /opt/scripts/jboss.sh start

Notable features:

* This command maps the local port (127.0.0.1:9990) to the Docker image's port 9990
* JBoss is started by running the helpful script **sh /opt/scripts/jboss.sh start**

## Default Username/Password

* The web UI has been configured with the username=manager, password=manager