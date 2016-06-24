SOURCES = $(wildcard *.c)
EXECUTABLES = $(SOURCES:.c=)

default: $(SOURCES)
	for exe in $(EXECUTABLES) ; do \
		gcc -g $$exe.c -o bin/$$exe ; \
	done

.PHONY: clean
clean:
	for exe in $(EXECUTABLES) ; do \
		rm bin/$$exe ; \
	done
