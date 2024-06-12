all:
	mkdir -p output bin
	echo "Compile version 1 with _start"
	gcc -c -o output/start1.o start1.s
	gcc -c -o output/main1.o main.c
	gcc -nostartfiles output/start1.o output/main1.o -o bin/main1
	echo "Compile version 2 with self_start"
	gcc -c -o output/start2.o start2.s
	gcc -c -o output/main2.o main.c
	gcc -nostartfiles -e self_start output/start2.o output/main2.o -o bin/main2

clean:
	rm -rf output bin
