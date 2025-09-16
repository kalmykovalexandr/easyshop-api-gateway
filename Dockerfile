FROM eclipse-temurin:21-jre
WORKDIR /app

# Expect that Maven has built target/app.jar before docker build
COPY target/app.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
