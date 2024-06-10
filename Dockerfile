FROM openjdk:17

WORKDIR /app

COPY target/my-app-1.0-SNAPSHOT.jar /app/my-java-app.jar

CMD ["java", "-jar", "my-java-app.jar"]