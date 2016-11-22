#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/JavaJaxRS/libraries/jersey1 -i modules/swagger-codegen/src/test/resources/2_0/petstore-with-fake-endpoints-models-for-testing.yaml -l jaxrs -o samples/server/petstore/jaxrs/jersey1 -DhideGenerationTimestamp=true --library=jersey1 --artifact-id=swagger-jaxrs-jersey1-server"

echo "Removing files and folders under samples/server/petstore/jaxrs/jersey1/src/main"
rm -rf samples/server/petstore/jaxrs/jersey1/src/main
find samples/server/petstore/jaxrs/jersey1 -maxdepth 1 -type f ! -name "README.md" -exec rm {} +
java $JAVA_OPTS -jar $executable $ags
