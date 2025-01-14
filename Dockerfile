# Usa la imagen oficial de Python 3.12 como base
FROM python:3.12-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el contenido de la carpeta 'app' al contenedor
COPY app /app

# Instala las dependencias necesarias
RUN pip install --no-cache-dir qdrant-client

# Define la variable de entorno (puedes sobrescribirla al ejecutar el contenedor)
ENV QDRANT_URL=""
ENV QDRANT_API_KEY=""

# Comando predeterminado para ejecutar tu script
CMD ["python", "qdrant.py"]
