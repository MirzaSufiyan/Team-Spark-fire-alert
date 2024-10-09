# Use Maven with OpenJDK 17 (choose a supported tag from Docker Hub)
FROM maven:3.8.6-openjdk-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Build the Maven project
RUN mvn clean package

# Use Tomcat as the base image to run the web app
FROM tomcat:9.0.65-jdk17

# Set the working directory inside Tomcat's webapps folder
WORKDIR /usr/local/tomcat/webapps/

# Copy the WAR file generated by Maven into the Tomcat webapps folder
COPY --from=build /app/target/yourproject.war ./ROOT.war

# Expose port 8080 to the outside world
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
