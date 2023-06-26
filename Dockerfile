FROM openjdk:8
EXPOSE 8090
ADD docker-demo.jar /app.jar
ENTRYPOINT ["java","-jar","app.jar"]
MAINTAINER aweit