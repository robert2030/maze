# Source and object files
SRCS = $(wildcard src/*.c)
OBJS = $(SRCS:src/%.c=src/%.o)

# Compiler and flags
CC = gcc
INCLUDE_PATHS = -I /usr/include/SDL2
LIBRARY_PATHS = -L /usr/lib
COMPILER_FLAGS = -Wall -Werror -Wextra -pedantic
LINKER_FLAGS = -lSDL2 -lm


# Output executable
OBJ_NAME = maze

# Default target: build executable
all: $(OBJ_NAME)

# Link object files to create the executable
$(OBJ_NAME): $(OBJS)
	$(CC) $(OBJS) $(LIBRARY_PATHS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)

# Compile each source file into an object file
src/%.o: src/%.c
	$(CC) $(INCLUDE_PATHS) -c $< -o $@ $(COMPILER_FLAGS)

# Clean up build files
clean:
	rm -f src/*.o $(OBJ_NAME)
