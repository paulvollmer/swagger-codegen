#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -i modules/swagger-codegen/src/test/resources/2_0/petstore.json -l typescript-angular2 -c bin/typescript-petstore-npm.json -o samples/client/petstore/typescript-angular2/npm"

java $JAVA_OPTS -jar $executable $ags
