cd C:\Users\Oda\Documents\Masteroppgave
xelatex -no-pdf main.tex
bibtex main
xelatex main.tex
xelatex -file-line-error main.tex
