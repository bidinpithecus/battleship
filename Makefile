CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -MMD -MP
LDFLAGS = -lm
SRC_DIR = src
INCLUDE_DIR = include
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(SRC_DIR)/%.o, $(wildcard $(SRC_DIR)/*.c))
BINARY = battleship

all: $(BINARY)

run: $(BINARY)
	./$^

$(BINARY): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

-include $(OBJECTS:.o=.d)

.PHONY: clean clear
clean:
	rm -f $(OBJECTS) $(OBJECTS:.o=.d) $(BINARY)

