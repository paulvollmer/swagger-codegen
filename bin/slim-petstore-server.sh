#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/slim -i modules/swagger-codegen/src/test/resources/2_0/petstore.yaml -l slim -o samples/server/petstore/slim"

java $JAVA_OPTS -jar $executable $ags
