FROM python:3.11-slim

# Instalar dependencias del sistema
# ffmpeg es necesario para yt-dlp (fusionar audio/video)
# git puede ser útil si yt-dlp necesita actualizarse desde git
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar requirements e instalar dependencias iniciales
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de la aplicación
COPY . .

# Crear directorio de descargas
RUN mkdir -p downloads

# Exponer el puerto
EXPOSE 5000

# Script de entrada para actualizar yt-dlp antes de iniciar
# Esto asegura que siempre se use la versión más reciente al reiniciar el contenedor
CMD pip install --upgrade yt-dlp && gunicorn -w 4 -b 0.0.0.0:5000 --timeout 120 app:app
