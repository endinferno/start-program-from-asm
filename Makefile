all:
	gcc -c -o start.o start.s
	gcc -c -o main.o main.c
	gcc -nostartfiles start.o main.o -o main

clean:
	rm start.o main.o main
