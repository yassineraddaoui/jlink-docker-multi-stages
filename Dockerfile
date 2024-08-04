# Stage 1: Compilation Stage
FROM openjdk as compile

WORKDIR /java

COPY src ./src

RUN javac -d out src/module-info.java

RUN javac -d out --module-path out src/main/Main.java

RUN jlink \
    --module-path /usr/bin/jmods:out \
    --add-modules myjavaDocker \
    --launcher app=myjavaDocker/main.Main \
    --output customjre

# Stage 2: Runtime Stage
FROM alpine:latest as runtime

WORKDIR /java
COPY --from=compile /java/customjre ./customjre/
ENV PATH="/java/customjre/bin:${PATH}"
CMD ["app"]
