FROM openjdk:8
COPY ./target/*jar financeme.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","/financeme.jar"]
