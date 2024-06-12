all:
	gcc -c -o start.o start.s
	gcc -c -o main.o main.c
	gcc -nostartfiles start.o main.o -o main

clean:
	rm -rf start.o main.o main
