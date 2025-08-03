
CC := $(CROSS_COMPILE)gcc
CROSS_COMPILE ?=

CFLAGS = -g -Wall -Werror

all: writer

fileList := $(wildcard *.c)
writer: $(fileList)
	$(CC) $(fileList) -o writer


clean:
	rm writer
	
