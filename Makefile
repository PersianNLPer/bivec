CC = gcc
CFLAGS = -lm -pthread -march=native -Wall -funroll-loops -Ofast -Wno-unused-result -w

all: bivec word2phrase distance bidist

bivec : src/bivec.c
	mkdir bin vectors -p
	$(CC) src/bivec.c -o bin/bivec $(CFLAGS)
bidist : src/bidist.c
	$(CC) src/bidist.c -o bin/bidist $(CFLAGS)
word2phrase : src/word2phrase.c
	$(CC) src/word2phrase.c -o bin/word2phrase $(CFLAGS)
distance : src/distance.c
	$(CC) src/distance.c -o bin/distance $(CFLAGS)
clean:
	rm -rf bin/bivec bin/word2phrase bin/distance bin/bidist
