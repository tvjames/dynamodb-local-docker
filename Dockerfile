FROM openjdk:latest

MAINTAINER Thomas James <docker-maint-dynamodb.tvjames@mailhero.io>

RUN mkdir /opt/dynamodb \
    && mkdir /var/dynamodb \
    && cd /tmp \
    && wget -O dynamodb_local_latest.tar.gz http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz \
    && tar xzvf dynamodb_local_latest.tar.gz -C /opt/dynamodb

EXPOSE 8000
VOLUME ["/opt/dynamodb", "/var/dynamodb"]

WORKDIR /opt/dynamodb
ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb", "-optimizeDbBeforeStartup"]
CMD ["-port", "8000"]
