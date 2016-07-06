# Makefile for asciidoc based presentation

TESTS=$(wildcard *.adoc)

default: $(patsubst %.adoc,%.html,$(TESTS))

%.html: %.adoc
	asciidoctor $<

open: $(TESTS)
	"$(shell which xdg-open || which open || which x-www-browser)" $(patsubst %.adoc,%.html,$<)

clean:
	rm -f *.html
