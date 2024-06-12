OUTPUT=output
BIN=bin
all:
	mkdir -p ${OUTPUT} ${BIN}
	echo "Compile version 1 with _start"
	gcc -c -o ${OUTPUT}/start1.o start1.s
	gcc -c -o ${OUTPUT}/main1.o main.c
	gcc -nostartfiles ${OUTPUT}/start1.o ${OUTPUT}/main1.o \
		-o ${BIN}/main1
	echo "Compile version 2 with self_start"
	gcc -c -o ${OUTPUT}/start2.o start2.s
	gcc -c -o ${OUTPUT}/main2.o main.c
	gcc -nostartfiles -e self_start \
		${OUTPUT}/start2.o ${OUTPUT}/main2.o -o ${BIN}/main2
	echo "Compile version 3 with cpp and _start"
	g++ -c -o ${OUTPUT}/start3.o start3.s
	g++ -c -o ${OUTPUT}/function.o function.cpp
	g++ -nostartfiles ${OUTPUT}/start3.o ${OUTPUT}/function.o \
		-o ${BIN}/main3 -Loutput -lshared_library

clean:
	rm -rf ${OUTPUT} ${BIN}
