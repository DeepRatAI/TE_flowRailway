# Dockerfile
FROM langflowai/langflow:latest

# Bundle JSON de tu Flow
ENV LANGFLOW_BUNDLE_URLS='["https://raw.githubusercontent.com/DeepRatAI/TE_flowRailway/main/TrueEyeBeta.json"]'

# Railway inyecta aquí el puerto en el que escuchar
# (si no está definido, usamos 7860 por defecto)
ENV PORT=${PORT:-7860}

# Exponer el puerto indicado
EXPOSE ${PORT}

# Arrancar Langflow escuchando en $PORT
ENTRYPOINT ["sh", "-c", "langflow run --host 0.0.0.0 --port $PORT"]

