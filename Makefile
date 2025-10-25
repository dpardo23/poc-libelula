# Variables
MAIN = main
MAIN_TEX = $(MAIN).tex
BUILDDIR = build
PDF = $(BUILDDIR)/$(MAIN).pdf

# Dependencias
# Define todos los archivos fuente de los que depende el PDF.
# Usamos 'wildcard' para encontrar automáticamente todos los .tex en 'sections/'.
DEPS = $(MAIN_TEX) preamble.tex $(wildcard sections/*.tex)

# Reglas Phony
.PHONY: all clean

# Reglas de Compilación
all: $(BUILDDIR)/$(MAIN).pdf

# 'pdf' es solo un alias para construir el archivo PDF final
pdf: $(PDF)

# REGLA PRINCIPAL: Cómo construir el PDF
# El $(PDF) depende de TODAS las dependencias en $(DEPS).
# Si CUALQUIERA de esos archivos cambia, esta regla se ejecutará.
$(PDF): $(DEPS)
	@mkdir -p $(BUILDDIR)
	@echo "Dependencias actualizadas. Compilando $(MAIN_TEX) en $(BUILDDIR)..."
	latexmk -pdf -outdir=$(BUILDDIR) $(MAIN)

# Regla de Limpieza
clean:
	@echo "Limpiando directorio $(BUILDDIR)..."
	# Usamos el 'rm -rf' que propusiste.
	rm -rf $(BUILDDIR)