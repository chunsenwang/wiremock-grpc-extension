FROM wiremock/wiremock:3.13.0

COPY wiremock-grpc-extension-standalone/build/libs/wiremock-grpc-extension*.jar /var/wiremock/extensions/

ENTRYPOINT ["/docker-entrypoint.sh", "--global-response-templating", "--disable-gzip", "--verbose"]
