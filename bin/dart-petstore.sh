#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"

ags="$@ generate -i modules/swagger-codegen/src/test/resources/2_0/petstore.yaml -l dart -o samples/client/petstore/dart/swagger"

# then options to generate the library for vm would be:
#ags="$@ generate -i modules/swagger-codegen/src/test/resources/2_0/petstore.yaml -l dart -o samples/client/petstore/dart/swagger_vm -DbrowserClient=false -DpubName=swagger_vm"
java $JAVA_OPTS -jar $executable $ags

# There is a proposal to allow importing different libraries depending on the environment:
# https://github.com/munificent/dep-interface-libraries
# When this is implemented there will only be one library.

# The current petstore test will then work for both: the browser library and the vm library.
