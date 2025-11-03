FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/*.jar ProjectManagementApp.jar

EXPOSE 9090

CMD [ "java","-jar", "ProjectManagementApp.jar" ]
