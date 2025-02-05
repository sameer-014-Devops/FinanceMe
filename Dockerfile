FROM openjdk:17
COPY ./target/*jar financeme.jar
ENTRYPOINT ["java","-jar","/financeme.jar"]
