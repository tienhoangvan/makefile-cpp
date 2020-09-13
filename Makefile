CC = g++
CFLAGS = -g -Wall -Wextra

SRC = src
BIN = bin
INCLUDE = include
LIB = lib

OUTFILE = main
LIBRARIES =

ifeq ($(OS),Windows_NT)
	EXECUTABLE = $(OUTFILE).exe
else
	EXECUTABLE = $(OUTFILE)
endif

INCLUDES = $(addprefix -I,$(INCLUDE))
LIBS = $(addprefix -L,$(LIB))
SOURCES = $(wildcard $(SRC)/*.cpp)

.PHONY: run clean

all: $(BIN)/$(EXECUTABLE)

run:
	./$(BIN)/$(EXECUTABLE)

clean:
	$(RM) $(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE): $(SOURCES)
	$(CC) $(CFLAGS) $^ -o $@ $(INCLUDES) $(LIBS) $(LIBRARIES)