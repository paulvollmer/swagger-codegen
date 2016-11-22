#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/JavaSpring/libraries/spring-cloud -i modules/swagger-codegen/src/test/resources/2_0/petstore.yaml -l spring -c bin/spring-cloud-feign-petstore.json -o samples/client/petstore/spring-cloud -DhideGenerationTimestamp=true,responseWrapper=HystrixCommand"

echo "Removing files and folders under samples/client/petstore/spring-cloud/src/main"
rm -rf samples/client/petstore/spring-cloud/src/main
find samples/client/petstore/spring-cloud -maxdepth 1 -type f ! -name "README.md" -exec rm {} +
java $JAVA_OPTS -jar $executable $ags
