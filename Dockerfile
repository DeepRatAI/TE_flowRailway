FROM langflowai/langflow:latest

# Copiamos el flow descriptor en la imagen para no depender de red
COPY TrueEyeBeta.json /app/TrueEyeBeta.json
ENV LANGFLOW_BUNDLE_PATHS='["/app/TrueEyeBeta.json"]'

# Railway define $PORT; si no existe, por defecto 7860
EXPOSE ${PORT:-7860}

# Arranque escuchando en $PORT
CMD ["sh", "-c", "langflow run --host 0.0.0.0 --port ${PORT:-7860}"]
