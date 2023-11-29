# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra

# Source files and object files
SRC_FILES = src
OBJ_FILES = $(SRC_FILES:.c=.o)

# Output executable
EXECUTABLE = hi

# Default target
all: $(EXECUTABLE)

# Rule to build the executable
$(EXECUTABLE): $(OBJ_FILES)
    $(CC) $(CFLAGS) -o $@ $^

# Rule to compile source files into object files
%.o: %.c
    $(CC) $(CFLAGS) -c -o $@ $<

# Clean rule
clean:
    rm -f $(OBJ_FILES) $(EXECUTABLE)
