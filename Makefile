CC=g++
CLIB=-isystem benchmark/include -Lbenchmark/build/src -lbenchmark -pthread
CFLAGS=-std=c++11
SOURCE=main.cpp
OUT=main

all:
	$(CC) $(CFLAGS) $(CLIB) -o $(OUT) $(SOURCE)

run: all
	./$(OUT) 

.PHONY: clean
clean:
	rm -f $(OUT)