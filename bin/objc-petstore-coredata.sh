#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/objc -i modules/swagger-codegen/src/test/resources/2_0/petstore.json -l objc -DapiDocs=false,modelDocs=false -o samples/client/petstore/objc/core-data --additional-properties coreData=true"

java -DappName=PetstoreClient $JAVA_OPTS -jar $executable $ags
