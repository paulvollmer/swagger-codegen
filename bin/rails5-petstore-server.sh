#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/rails5 -i modules/swagger-codegen/src/test/resources/2_0/petstore.yaml -l rails5 -o samples/server/petstore/rails5"

java $JAVA_OPTS -jar $executable $ags
