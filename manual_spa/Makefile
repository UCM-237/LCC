all: lcc_manual.pdf

clean:
	$(RM) *~ *.pdf *.dvi *.log *.aux *.bbl *.blg *.toc *.lol *.loa *.lox \
		*.lot *.out *.lg *.tmp *.xref *.lof .*.swp *.idx *.ilg *.ind *.ist

lcc_manual.pdf: lcc_manual.tex
	pdflatex lcc_manual
	#bibtex lcc_manual
	pdflatex lcc_manual
	pdflatex lcc_manual
