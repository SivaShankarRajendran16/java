# stage 1 : build stage for maven 
FROM maven:3.8.5-openjdk-17-slim AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests


#JAVA JDK TO RUN
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 1001
ENTRYPOINT ["java","-jar","app.jar"]

