.PHONY: all

all: clean build test
build:
	$(CC) hello.c -o hello

test:
	file ./hello
	./hello

clean:
	rm -f hello
