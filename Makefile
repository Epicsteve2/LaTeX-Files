SHELL := $(shell which bash)
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all

# finds all tex files, gets just the filename, replaces spaces with '\ ', and adds the prefix and suffix 'pdf/' and '.pdf'
# need to replace spaces cuz spaces suck in makefiles
PDF_FILES := $(shell find src -name '*.tex' -exec basename {} .tex ';' | sed -e 's| |\\ |g' -e 's|.*|pdf/&\.pdf|')

## Other things i've tried
## Gets all filenames with no extension
# TEX_FILES := $(shell find src -name '*.tex' -exec basename {} .tex ';')
## same thing, but with make
# pdfs := $(wildcard src/*.tex)
## Also there's addprefix, but idk if it works. I don't wanna bother with make functions if I don't have to
# all: $(addprefix pdf/,$(TEX_FILES2))

.PHONY: all
all: $(PDF_FILES)
	
# I should really use taskfile or something huh...
pdf/%.pdf: src/%.tex $(wildcard images/%*)
	@cd src && \
	latexmk --pdf --quiet --output-directory=../pdf/ '$*.tex'

.PHONY: clean
clean:
	cd src && \
	latexmk -C
