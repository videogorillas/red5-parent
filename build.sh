set -xue

mvn clean install -U

cd red5-io
mvn clean install -U

cd ../red5-server-common
mvn clean install -U

cd ../red5-service
mvn clean install -U

cd ../red5-server
mvn clean install -U

cd ../red5-client
mvn clean install -U

