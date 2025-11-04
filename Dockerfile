FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY target/*.jar ProjectManagementApp.jar

EXPOSE 9090

CMD ["java", "-jar", "ProjectManagementApp.jar"]
