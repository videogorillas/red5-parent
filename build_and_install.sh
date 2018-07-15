#!/bin/sh

set -xue

mvn clean install -Dmaven.test.skip=true 

cd red5-io
mvn clean install -Dmaven.test.skip=true 

cd ../red5-server-common
mvn clean install -Dmaven.test.skip=true

cd ../red5-service
mvn clean install -Dmaven.test.skip=true

cd ../red5-server
mvn clean install -Dmaven.test.skip=true

cd ../red5-client
mvn clean install -Dmaven.test.skip=true
