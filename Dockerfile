# FROM eclipse-temurin:17-jdk-jammy as builder
# WORKDIR /app
# COPY . .
# RUN mvn clean package -DskipTests

# FROM eclipse-temurin:17-jre-jammy
# WORKDIR /app
# COPY --from=builder /app/target/eureka-server-0.0.1-SNAPSHOT.jar app.jar
# EXPOSE 8761
# ENTRYPOINT ["java", "-jar", "app.jar"]


#FROM eclipse-temurin:17-jdk-jammy as builder
FROM maven:3.8.6-eclipse-temurin-11-alpine AS maven
RUN apk update && apk add git && apk add net-tools procps openssh-client openssh-server
RUN mkdir -p $HOME/images/lib/ && cd $HOME/images/lib/
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=maven /app/target/eureka-server-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "app.jar"]
