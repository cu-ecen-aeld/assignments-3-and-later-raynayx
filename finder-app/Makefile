#optional compiler selection
CC := $(CROSS_COMPILE)gcc
CROSS_COMPILE ?=

CFLAGS = -g -Wall -Werror

all: writer

fileList := $(wildcard *.c)
writer: $(fileList)
	$(CC) $(CFLAGS) $(fileList) -o writer


clean:
	rm writer
	
