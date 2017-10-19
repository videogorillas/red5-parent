#!/bin/sh

set -xue

TEMP=$(mktemp -d /tmp/red5.XXXX)

mvn clean deploy -Dmaven.test.skip=true -DperformRelease=true -DaltDeploymentRepository=vg::default::file://"$TEMP"

cd red5-io
mvn clean deploy -Dmaven.test.skip=true -DperformRelease=true -DaltDeploymentRepository=vg::default::file://"$TEMP"

cd ../red5-server-common
mvn clean deploy -Dmaven.test.skip=true -DperformRelease=true -DaltDeploymentRepository=vg::default::file://"$TEMP"

cd ../red5-service
mvn clean deploy -Dmaven.test.skip=true -DperformRelease=true -DaltDeploymentRepository=vg::default::file://"$TEMP"

cd ../red5-server
mvn clean deploy -Dmaven.test.skip=true -DperformRelease=true -DaltDeploymentRepository=vg::default::file://"$TEMP"

cd ../red5-client
mvn clean deploy -Dmaven.test.skip=true -DperformRelease=true -DaltDeploymentRepository=vg::default::file://"$TEMP"

chmod 755 "$TEMP"

rsync -av "$TEMP"/ chexov@kote.videogorillas.com:/storage/m2repo/
