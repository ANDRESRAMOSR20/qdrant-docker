# qdrant & Docker
1. Installation
```bash
pip install qdrant-client
```
2. Creacion de Dockerfile, en este archivo ingresaremos los detalles del lenguaje, el nombre del directorio (/app), la extraccion de archivos (COPY), instalacion de librerias, las variables de entorno y el comando de script de ejecucion.
```Dockerfile
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
```
3. Creacion del Script para vincular qdrant y llamar sus colecciones:
```python
from qdrant_client import QdrantClient
import os

# Leer configuración desde variables de entorno
qdrant_url = os.getenv("QDRANT_URL")
qdrant_api_key = os.getenv("QDRANT_API_KEY")

# Crear una instancia del cliente Qdrant
client = QdrantClient(
    url=qdrant_url,
    api_key=qdrant_api_key
)

def verificar_conexion():
    try:
        # Intentar realizar una llamada de prueba (por ejemplo, obtener las colecciones existentes)
        collections = client.get_collections()
        print("Conexión exitosa. Colecciones disponibles:", collections)
        return True
    except Exception as e:
        print("Error al conectar con Qdrant:", e)
        return False
verificar_conexion()

```
4. Crearemos la imagen de docker con:
```bash
docker build -t qdrant-client-test .
```
5. Por ultimo inicializaremos el contenedor de ejecucion con:
```bash
docker run qdrant-client-test
```
- Esto nos devolvera las colecciones que tenemos en nuestro cluster de qdrant.

