CC = gcc
CFLAGS = -lm -pthread -march=native -Wall -funroll-loops -Ofast -Wno-unused-result -w

all: bivec distance bidist

bivec : src/bivec.c
	mkdir bin vectors -p
	$(CC) src/bivec.c -o bin/bivec $(CFLAGS)
bidist : src/bidist.c
	$(CC) src/bidist.c -o bin/bidist $(CFLAGS)
distance : src/distance.c
	$(CC) src/distance.c -o bin/distance $(CFLAGS)
clean:
	rm -rf bin/bivec bin/distance bin/bidist
