.PHONY: all clean

DOCUMENT = main

all: $(DOCUMENT).pdf

$(DOCUMENT).pdf: $(DOCUMENT).tex
    pdflatex $(DOCUMENT)
    biber $(DOCUMENT)
    pdflatex $(DOCUMENT)
    pdflatex $(DOCUMENT)

clean:
    rm -f *.aux *.log *.toc *.out *.bbl *.blg *.bcf *.run.xml