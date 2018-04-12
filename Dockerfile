FROM openjdk:8-jdk
MAINTAINER Sanjay Rauniyar
RUN mkdir -p /tmp/deploy
COPY ./spring*.jar /tmp/deploy/
CMD ["java" ,"-jar" ,"/tmp/deploy/spring-petclinic-1.5.1.jar"]
