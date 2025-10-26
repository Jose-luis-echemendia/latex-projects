FROM ubuntu:22.04

# Evitar preguntas interactivas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar e instalar paquetes necesarios
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # LaTeX completo
    texlive-full \
    # Herramientas adicionales
    biber \
    make \
    git \
    # Editor de texto ligero (opcional)
    vim \
    # Limpiar cache para reducir tamaño
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Establecer directorio de trabajo
WORKDIR /workspace

# Comando por defecto
CMD ["/bin/bash"]