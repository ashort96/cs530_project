CC=g++
CLIB=-isystem benchmark/include -Lbenchmark/build/src -lbenchmark -pthread
CFLAGS=-std=c++11
SOURCE=main.cpp
OUT=main

all:
	$(CC) $(SOURCE) $(CFLAGS) $(CLIB) -o $(OUT)

run: all
	./$(OUT) 

docker-build:
	docker build --rm -f "Dockerfile" -t cs530_project:latest .


.PHONY: clean
clean:
	rm -f $(OUT)
