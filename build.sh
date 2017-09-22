set -xue

rsync -var red5-server-common/android/ ~/.m2/repository/android/


cd red5-io
mvn clean install -U

cd ../red5-server-common
mvn clean install -U

cd ../red5-server
mvn clean install -U

cd ../red5-client
mvn clean install -U

