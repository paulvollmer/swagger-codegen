#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -i modules/swagger-codegen/src/test/resources/2_0/petstore-with-fake-endpoints-models-for-testing.yaml -l java -c bin/java8-petstore-jersey2.json -o samples/client/petstore/java/jersey2-java8 -DhideGenerationTimestamp=true"

echo "Removing files and folders under samples/client/petstore/java/jersey2-java8/src/main"
rm -rf samples/client/petstore/java/jersey2-java8/src/main
find samples/client/petstore/java/jersey2-java8 -maxdepth 1 -type f ! -name "README.md" -exec rm {} +
java $JAVA_OPTS -jar $executable $ags
