FROM openjdk:17

WORKDIR /app

COPY target/my-java-app-0.0.1-SNAPSHOT.jar /app/my-java-app.jar

CMD ["java", "-jar", "my-java-app.jar"]