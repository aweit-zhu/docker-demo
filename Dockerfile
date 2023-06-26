FROM openjdk:8
EXPOSE 8090
COPY target/docker-demo.jar docker-demo.jar
ENTRYPOINT ["java","-jar","docker-demo.jar"]
