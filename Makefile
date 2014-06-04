all:
	./gitfix.sh
	xelatex  -shell-escape annpacks.tex
	biber annpacks
	xelatex  -shell-escape annpacks.tex
	xelatex  -shell-escape annpacks.tex
	rm -rf *.aux *.bbl *.bcf *.log *.blg *.run.xml

