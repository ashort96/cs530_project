FROM ubuntu:latest
LABEL Name=cs530_project Version=0.0.1
WORKDIR /usr/src/app

RUN apt -y update && apt-get install -y cmake git gcc g++

COPY init.sh main.cpp Makefile /usr/src/app/

CMD [ "./init.sh", "DOCKER" ]
