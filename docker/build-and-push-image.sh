#! /bin/bash

## set this dir as the current dir
cd "$(dirname "$0")"

cd ..
## build the image
./gradlew clean wiremock-grpc-extension-standalone:shadowJar

## extract version from jar file extension
version=$(ls wiremock-grpc-extension-standalone/build/libs/wiremock-grpc-extension-standalone-*.jar | sed 's/.*wiremock-grpc-extension-standalone-\(.*\).jar/\1/')

docker build -t chunsenwang/wiremock-grpc:${version} -f docker/Dockerfile .

## push the image to docker hub
docker push chunsenwang/wiremock-grpc:${version}