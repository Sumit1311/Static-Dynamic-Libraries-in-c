CC=gcc
CFLAGS=-I./include
ARCHIVE = ar

SRC=./source
LIB=./lib
INC=./include
BIN=./bin
OBJ=./obj

all: $(BIN)/main.out

$(BIN)/main.out: $(LIB)/libsample.a $(OBJ)/main.o $(LIB)/libsampledynamic.so
	$(CC) -o $@ $(OBJ)/main.o -L./lib -lsample -lsampledynamic -Wl,-rpath=./lib

$(LIB)/libsample.a: $(OBJ)/sample.o
	$(ARCHIVE) rcs $@ $(OBJ)/sample.o

$(OBJ)/sample.o: $(SRC)/sample.c
	$(CC) -o $@ -c $<

$(OBJ)/main.o: $(INC)/libsample.h main.c
	$(CC) -o $@ -c main.c $(CFLAGS)

$(LIB)/libsampledynamic.so: $(SRC)/sampleDynamic.c
	gcc -c -fpic $< -o $(OBJ)/libsampledynamic.o
	gcc -shared -o $@ $(OBJ)/libsampledynamic.o

clean: 
	rm -rf ./obj/*.o
	rm -rf ./bin/*