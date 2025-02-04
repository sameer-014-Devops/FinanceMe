FROM openjdk:8
COPY ./target/*jar financeme.jar
ENTRYPOINT ["java","-jar","/financeme.jar"]
