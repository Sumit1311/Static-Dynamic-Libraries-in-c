CC = gcc
ARCHIVE = ar

build: sample.o
	$(ARCHIVE) rcs libsample.a sample.o

sample.o: sample.c
	$(CC) -o $@ -c $^ 