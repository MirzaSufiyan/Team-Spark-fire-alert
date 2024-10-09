# Use an official Tomcat image as a base
FROM tomcat:9.0-jdk11-openjdk

# Copy your webapp files (JSP, HTML, etc.) to the webapps directory in Tomcat
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
