CC=gcc
CFLAGS=-I./include
ARCHIVE = ar

SRC=./source
LIB=./lib
INC=./include
BIN=./bin
OBJ=./obj

build: libsample.a main.o
	$(CC) -o main.out $(OBJ)/main.o -L./lib -lsample

libsample.a: sample.o
	$(ARCHIVE) rcs $(LIB)/libsample.a $(OBJ)/sample.o

sample.o: 
	$(CC) -o $(OBJ)/$@ -c $(SRC)/sample.c 

main.o: 
	$(CC) -o $(OBJ)/main.o -c main.c $(CFLAGS)