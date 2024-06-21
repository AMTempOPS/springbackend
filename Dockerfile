FROM maven:3.8.1-jdk-8 as builder
WORKDIR /app
COPY . .
RUN mvn package -DskipTests
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]