FROM maven:3.6-jdk-11 AS build
WORKDIR /backend
COPY ./pom.xml ./
COPY ./src ./src

RUN mvn package -DskipTests

FROM openjdk:11-jre
COPY --from=build /backend/target/*.jar /app/backend.jar
CMD ["java", "-jar", "/app/backend.jar"]
