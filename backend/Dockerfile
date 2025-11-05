# Use a commonly available Maven image with JDK 17
# Use a Maven image that bundles Eclipse Temurin JDK 17
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app

# copy maven files and source; this builds the Spring Boot jar
COPY pom.xml ./
COPY src ./src

# skip tests in build for faster image creation (remove -DskipTests to run tests)
RUN mvn -B -DskipTests package

# Use a small Temurin JRE based on Ubuntu Jammy for runtime
FROM --platform=linux/amd64 eclipse-temurin:17-jre
WORKDIR /app

# copy the packaged jar (assumes single jar in target)
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
