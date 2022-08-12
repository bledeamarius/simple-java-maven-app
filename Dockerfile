FROM maven:3.8.6-jdk-11 AS builder

ARG BUILD_NUMBER

# Add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package the app
RUN mvn clean package

# 2nd Stage
FROM openjdk:11

ARG BUILD_NUMBER

COPY --from=builder "target/marius-s-simple-app-1.${BUILD_NUMBER}.jar" "marius-s-simple-app-1.${BUILD_NUMBER}.jar"

ARG PORT_TO_EXPOSE=8080

EXPOSE ${PORT_TO_EXPOSE}

CMD ["java", "-jar","marius-s-simple-app-1.${BUILD_NUMBER}.jar"]
