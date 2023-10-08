## Stage 1 : build with maven builder image with native capabilities
FROM quay.io/quarkus/centos-quarkus-maven:21.2.0-java11 AS build
COPY pom.xml /usr/src/app/
RUN mvn -f /usr/src/app/pom.xml -B org.apache.maven.plugins:maven-dependency-plugin:3.1.2:resolve-plugins
COPY src /usr/src/app/src
WORKDIR /usr/src/app
RUN mvn clean package

## Stage 2 : create the docker final image
FROM registry.access.redhat.com/ubi8/ubi-minimal
WORKDIR /work/
COPY --from=build /usr/src/app/target/*-runner.jar /work/application.jar
RUN chmod 775 /work
EXPOSE 8080
CMD ["java", "-jar", "/work/application.jar"]
