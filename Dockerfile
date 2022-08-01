FROM maven:3.8.6-jdk-11 AS builder

# Add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package the app
RUN mvn clean package

# 2nd Stage
FROM openjdk:11

COPY --from=builder "target/marius-s-simple-app-1.${env.BUILD_NUMBER}-SNAPSHOT.jar" "marius-s-simple-app-1.${env.BUILD_NUMBER}-SNAPSHOT.jar"

EXPOSE 8080

CMD ["java", "-jar","marius-s-simple-app-1.${env.BUILD_NUMBER}-SNAPSHOT.jar"]
