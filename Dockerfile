FROM maven:3.9.5-amazoncorretto-21 AS build
RUN mkdir /app
WORKDIR /app

ADD . /app/
RUN RUN mvn package -Dmaven.test.skip

ENTRYPOINT ["java", "-jar", "/app/target/circuitbreaker.jar"]