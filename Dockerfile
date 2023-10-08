# Этап сборки
FROM maven:3.6-jdk-11 AS build
WORKDIR /backend
COPY ./pom.xml ./
COPY ./src ./src

# Сборка приложения
RUN mvn package

# Этап выполнения
FROM openjdk:11-jre
COPY --from=build /backend/target/*-runner.jar /app/backend-runner.jar
CMD ["java", "-jar", "/app/backend-runner.jar"]
