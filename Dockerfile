# Use an official Tomcat image as a base
FROM tomcat:9.0-jdk11-openjdk

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Copy the contents of the webapp directory (JSPs, web.xml, etc.) to the webapps directory of Tomcat
COPY src/main/webapp/ .

# Expose port 8080 for the Tomcat server
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
