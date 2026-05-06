pdflatex -interaction=nonstopmode example.tex

# Si hay errores, corrígelos antes de continuar

# Generar glosario y acrónimos

makeglossaries example

# Debe mostrar algo como "makeglossaries version 4.46"

# Si falla, ejecuta: which makeglossaries (para ver si está en el PATH)

# Generar bibliografía

biber example

# Debe mostrar algo como "INFO - This is Biber"

# Si falla, ejecuta: which biber (para ver si está en el PATH)

# Compilaciones finales para integrar todas las referencias cruzadas

pdflatex -interaction=nonstopmode example.tex
pdflatex -interaction=nonstopmode example.tex
