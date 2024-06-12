all:
	echo "Compile version 1 with _start"
	gcc -c -o start1.o start1.s
	gcc -c -o main.o main.c
	gcc -nostartfiles start1.o main.o -o main1
	echo "Compile version 2 with self_start"
	gcc -c -o start2.o start2.s
	gcc -c -o main.o main.c
	gcc -nostartfiles -e self_start start2.o main.o -o main2

clean:
	rm -rf start1.o start2.o main.o main1 main2
