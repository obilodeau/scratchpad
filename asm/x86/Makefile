SOURCES = $(wildcard *.asm)
OBJECTS = $(SOURCES:.asm=.o)
EXECUTABLES = $(OBJECTS:.o=)

# Generic rule
# $< is the first dependency name
# $@ is the target filename
%.o: %.asm
	nasm -f elf $< -o $@

# linking problems
# http://stackoverflow.com/questions/13989396/cant-run-executable-linked-with-libc
# ld:
# -O0 removes optimizations 
# -s  strips
# -lc link with C library
# gcc (yields bigger binaries)
#		gcc $$exe.o -o $$exe ;
default: $(OBJECTS)
	for exe in $(EXECUTABLES) ; do \
		ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 $$exe.o -o $$exe -lc -s ; \
	done

.PHONY: clean
clean:
	rm *.o
	for exe in $(EXECUTABLES) ; do \
		rm $$exe ; \
	done
