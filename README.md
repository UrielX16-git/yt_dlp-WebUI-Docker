# yt_dlp-WebUI-Docker

Una interfaz web simple para descargar videos y audios desde múltiples plataformas usando yt-dlp.

## Descripción

Esta aplicación web permite descargar videos y audios desde plataformas como YouTube, Twitch, Twitter, Vimeo, y muchas otras soportadas por yt-dlp. Incluye una interfaz web fácil de usar construida con Flask, y está completamente contenerizada con Docker para una implementación sencilla.

## Características

- Descarga de videos en múltiples formatos (MP4, etc.)
- Extracción de audio en MP3
- Descarga de subtítulos (automáticos o específicos)
- Soporte para playlists completas
- Interfaz web intuitiva
- Contenerización completa con Docker
- Gestión automática de archivos expirados
- Descargas asíncronas con progreso en tiempo real

## Instalación y Despliegue

### Prerrequisitos

- Docker y Docker Compose instalados en tu sistema.

### Despliegue rápido

1. Clona el repositorio:
   ```bash
   git clone https://github.com/UrielX16-git/yt_dlp-WebUI-Docker.git
   cd yt_dlp-WebUI-Docker
   ```

2. Ejecuta la aplicación:
   ```bash
   docker-compose up -d
   ```

3. Accede a la aplicación en `http://localhost:5000` (o la IP de tu servidor).

### Detener la aplicación

```bash
docker-compose down
```

## Uso

1. Ve a la interfaz web.
2. Pega la URL del video que deseas descargar.
3. Selecciona el formato (video o audio), calidad y opciones de subtítulos.
4. Inicia la descarga y monitorea el progreso.
5. Descarga el archivo desde la sección de historial.

## Atribuciones

Esta aplicación utiliza la librería [yt-dlp](https://github.com/yt-dlp/yt-dlp), una bifurcación mejorada de youtube-dl que soporta descargas desde cientos de sitios web incluyendo YouTube, Twitch, Twitter, Vimeo, Dailymotion, y muchos más.

Asegúrate de revisar las políticas de uso de las plataformas de las que descargues contenido y respeta los derechos de autor.

## Estructura del Proyecto

- `app.py`: Aplicación principal de Flask
- `Dockerfile`: Configuración del contenedor Docker
- `docker-compose.yml`: Configuración de servicios Docker
- `requirements.txt`: Dependencias de Python
- `templates/`: Plantillas HTML
- `static/`: Archivos CSS y JS

