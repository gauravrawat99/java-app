FROM openjdk:17

WORKDIR /app

COPY target/my-app-1.0-SNAPSHOT.jar /app/my-java-app.jar

# start java app with coommand

CMD ["java", "-jar", "my-java-app.jar"]