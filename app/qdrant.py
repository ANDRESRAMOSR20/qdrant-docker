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



