pdflatex -interaction=nonstopmode example.tex
# Si hay errores, corrígelos antes de continuar

biber example
# Debe mostrar algo como "INFO - This is Biber"
# Si falla, ejecuta: which biber  (para ver si está en el PATH)

pdflatex -interaction=nonstopmode example.tex
pdflatex -interaction=nonstopmode example.tex