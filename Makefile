SRCS=$(wildcard *.md)

OBJS=$(SRCS:.md=.pdf)

export PATH := $(PATH):./node_modules/.bin

all: $(OBJS)

.SUFFIXES: .md .html .pdf

%.html: %.md style.css
	    markdown "$<" >"$@"

%.pdf: %.html
	chrome-headless-render-pdf --chrome-option=--no-sandbox --scale=.90 --url=file://$(abspath $<) --pdf="$@" #>/dev/null

clean :
	rm -f $(OBJS)

