FROM openjdk:8
EXPOSE 8090
ADD docker-demo.jar docker-demo.jar
ENTRYPOINT ["java","-jar","docker-demo.jar"]
MAINTAINER aweit