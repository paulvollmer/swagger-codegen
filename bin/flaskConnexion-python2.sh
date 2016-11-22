#!/bin/sh
source bin/_util.sh

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"
#ags="$@ generate -i modules/swagger-codegen/src/test/resources/2_0/petstore.yaml -l python-flask -o samples/server/petstore/flaskConnexion-python2 -DsupportPython2=true"
ags="$@ generate -t modules/swagger-codegen/src/main/resources/flaskConnexion -i modules/swagger-codegen/src/test/resources/2_0/petstore.yaml -l python-flask -o samples/server/petstore/flaskConnexion-python2 -c bin/supportPython2.json"

rm -rf samples/server/petstore/flaskConnexion-python2/*
java $JAVA_OPTS -Dservice -jar $executable $ags
