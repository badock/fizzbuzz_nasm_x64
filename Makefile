clean:
	if [ -f test ]; then rm test; fi
	if [ -f test.o ]; then rm test.o; fi
	if [ -f test.lst ]; then rm test.lst; fi
compile:
	nasm -g -f elf64 -F dwarf -l test.lst  test.s
	gcc -m64 -o test  test.o
	./test
all: clean compile
