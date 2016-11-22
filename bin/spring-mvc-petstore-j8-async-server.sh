#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/JavaSpring -i modules/swagger-codegen/src/test/resources/2_0/petstore-with-fake-endpoints-models-for-testing.yaml -l spring --library spring-mvc -o samples/server/petstore/spring-mvc-j8-async -c bin/spring-mvc-petstore-j8-async.json -DhideGenerationTimestamp=true,java8=true,async=true"

java $JAVA_OPTS -jar $executable $ags
