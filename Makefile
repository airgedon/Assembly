CC = fasm
.PHONY: default compile build once dump hex run
default: build run
build: main.asm
	$(CC) main.asm
	ld main.o $(LIBS) -o main
once: main.asm
	$(CC) main.asm
	ld main.o -o main
dump: main
	objdump -S -M intel -d  main > obj.dump
	cat obj.dump
hex: main
	hexeditor main
run: main
	./main
