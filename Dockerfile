# Usa la imagen oficial de Python 3.12 como base
FROM python:3.12-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el contenido de la carpeta 'app' al contenedor
COPY app /app

# Instala las dependencias necesarias
RUN pip install --no-cache-dir qdrant-client

# Define la variable de entorno (puedes sobrescribirla al ejecutar el contenedor)
ENV QDRANT_URL="https://223e208e-ebb0-4620-bcda-6ac911ca659d.us-east4-0.gcp.cloud.qdrant.io"
ENV QDRANT_API_KEY="OETw6acq4sq6t_vdb3LA4WCxP0qw88tBCGVj0PF1KdHGrYgw551bkQ"

# Comando predeterminado para ejecutar tu script
CMD ["python", "qdrant.py"]
