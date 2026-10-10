FROM alpine/java:21-jdk AS build
WORKDIR app
COPY . .
RUN ./gradlew build

FROM alpine/java:21-jre AS app
WORKDIR app
COPY --from=build /app/build/libs/ .
CMD ["java", "-jar", "rest_tutorial-0.0.1-SNAPSHOT.jar"]