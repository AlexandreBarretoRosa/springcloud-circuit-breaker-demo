FROM public.ecr.aws/docker/library/maven:3-amazoncorretto-17 AS build
WORKDIR /project
ADD pom.xml /project
RUN mvn verify --fail-never
COPY . .
RUN mvn package
FROM public.ecr.aws/amazoncorretto/amazoncorretto:17
COPY --from=build /project/target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
