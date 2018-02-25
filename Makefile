clean:
	if [ -f fizzbuzz ]; then rm fizzbuzz; fi
	if [ -f fizzbuzz.o ]; then rm fizzbuzz.o; fi
	if [ -f fizzbuzz.lst ]; then rm fizzbuzz.lst; fi
compile:
	nasm -g -f elf64 -F dwarf -l fizzbuzz.lst  fizzbuzz.s
	gcc -m64 -o fizzbuzz  fizzbuzz.o
run:
	./test
all: clean compile run
