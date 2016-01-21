#!/usr/bin/env bash

CATALINA_OPTS="-Xms256m -Xmx2G"
CATALINA_OPTS="$CATALINA_OPTS -Xss256k"
CATALINA_OPTS="$CATALINA_OPTS -XX:ThreadPriorityPolicy=42"
CATALINA_OPTS="$CATALINA_OPTS -XX:MaxGCPauseMillis=150"

CATALINA_OPTS="$CATALINA_OPTS -server"
CATALINA_OPTS="$CATALINA_OPTS -XX:+DisableExplicitGC"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

JAR_FILE="replace me"

LISTEN_PORT=${PORT:-5000}

# http://docs.oracle.com/middleware/1213/wls/WLSRN/issues.htm#BCFFDBEB
java -Djava.security.egd=file:/dev/./urandom \
$CATALINA_OPTS -jar $DIR/$JAR_FILE \
--server.port=$LISTEN_PORT --server.tomcat.uri-encoding=UTF-8