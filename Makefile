TARGET_NAME = clox
LIBS = -lm
CC = gcc
CFLAGS = -g -Wall
BIN_PATH = bin
TEST_PATH = test/test.lox

TARGET = $(BIN_PATH)/$(TARGET_NAME)

.PHONY: default all clean test

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@
	-rm -f *.o

test:
	$(TARGET) $(TEST_PATH)

clean:
	-rm -f *.o
	-rm -f $(TARGET)