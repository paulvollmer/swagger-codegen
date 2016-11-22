#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
# complex module name used for testing
ags="$@ generate -i modules/swagger-codegen/src/test/resources/2_0/petstore-with-fake-endpoints-models-for-testing.yaml  -l perl -o samples/client/petstore/perl"

java $JAVA_OPTS -jar $executable $ags

java $JAVA_OPTS -jar $executable $ags --additional-properties moduleName=Something::Deep -o samples/client/petstore/perl/deep_module_test
