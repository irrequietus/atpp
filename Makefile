##
## Copyright (C) 2014, George Makrydakis <irrequietus@gmail.com>
##
## Makefile for "Annotated C++ Template Parameter Packs" draft
## See https://github/irrequietus/atpp for more details.
##
## This makefile requires GNU make in order to work correctly. I am not using
## TeX packages for git versioning because there are several things that don't
## work well with them.
##
##
##

## We need the current revision first, short version.
GITSHORTREV:=$(shell git --no-pager log -1 --date=short --pretty=format:"%h")

## Call git with --pretty-format for output purposes.
define gitln
    @printf "\\\newcommand{\%s}{%s}\n" "$1" \
	"$(shell git --no-pager log -1 --date=short --pretty=format:"$2")"
endef

## Create all the \newcommand sections that are necessary.
define gitfn
	$(shell rm -rf gitrev.tex)
	$(call gitln,"GitShortRev","%h") >> gitrev.tex
	$(call gitln,"GitLongRev","%H") >> gitrev.tex
	$(call gitln,"GitAuthorName","%an") >> gitrev.tex
	$(call gitln,"GitAuthorEmail","%ae") >> gitrev.tex
	$(call gitln,"GitCommitDate","%ci") >> gitrev.tex
endef

all: clean
	$(call gitfn)
	xelatex -shell-escape annpacks.tex
	biber annpacks
	xelatex -shell-escape annpacks.tex
	xelatex -shell-escape annpacks.tex
	rm -rf *.aux *.bbl *.bcf *.log *.blg *.run.xml gitrev.tex
	mv annpacks.pdf atpp-$(GITSHORTREV).pdf
	clear
	sha1sum atpp-$(GITSHORTREV).pdf
clean:
	rm -rf *.aux *.bbl *.bcf *.log *.blg *.run.xml gitrev.tex
