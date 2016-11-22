#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/MSF4J -i modules/swagger-codegen/src/test/resources/2_0/petstore-with-fake-endpoints-models-for-testing.yaml -l msf4j -o samples/server/petstore/java-msf4j/ -DhideGenerationTimestamp=true"

echo "Removing files and folders under samples/server/petstore/java-msf4j/src/main"
rm -rf samples/server/petstore/java-msf4j/src/main
find samples/server/petstore/java-msf4j -maxdepth 1 -type f ! -name "README.md" -exec rm {} +
java $JAVA_OPTS -jar $executable $ags
