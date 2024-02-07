FROM eclipse-temurin:17-jdk as build
WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs maven

COPY pom.xml .
RUN mvn dependency:go-offline

COPY . .
RUN mvn -Pproduction package

# Run stage
FROM eclipse-temurin:17-jre
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
