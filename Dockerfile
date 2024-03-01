FROM maven:3.8.3-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean install


FROM tomcat:9
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder target/*.war /usr/localtomcat/webapps/ROOT.war
EXPOSE 8080
CMD [ "catalina.sh", "run" ]