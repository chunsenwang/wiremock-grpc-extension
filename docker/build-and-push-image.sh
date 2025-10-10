#! /bin/bash

#set -x

### set this dir as the current dir
cd "$(dirname "$0")"
cd ..

### build the image
./gradlew clean wiremock-grpc-extension-standalone:shadowJar

### extract version from jar file extension
version=$(ls wiremock-grpc-extension-standalone/build/libs/wiremock-grpc-extension-standalone-*.jar | sed 's/.*wiremock-grpc-extension-standalone-\(.*\).jar/\1/')

manifest=docker.io/chunsen/wiremock-grpc:${version}
podman manifest create $manifest

#
podman build \
--platform linux/arm/v7,linux/arm64,linux/amd64 \
-f docker/Dockerfile \
--manifest $manifest .

podman manifest push $manifest