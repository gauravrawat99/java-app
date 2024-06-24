FROM openjdk:17

WORKDIR /app

COPY target/spring-boot-hello-world-1.0.jar /app/my-java-app.jar

# start java app with command and 

CMD ["java", "-jar", "my-java-app.jar"]