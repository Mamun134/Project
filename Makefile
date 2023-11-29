# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra

# Directories
SRC_DIR = src
BUILD_DIR = build

# Source files and object files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC_FILES))

# Output executable
EXECUTABLE = myprogram

# Default target
all: $(BUILD_DIR) $(EXECUTABLE)

# Rule to create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Rule to build the executable
$(EXECUTABLE): $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $^

# Rule to compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean rule
clean:
	rm -rf $(BUILD_DIR) $(EXECUTABLE)

.PHONY: all clean
