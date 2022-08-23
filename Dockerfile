FROM tomcat

COPY  "*.war" "/usr/local/tomcat/webapps/"

# ARG PORT_TO_EXPOSE=8080

# EXPOSE ${PORT_TO_EXPOSE}

CMD ["catalina.sh" , "run"]
