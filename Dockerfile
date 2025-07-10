# ┌───────────────────────────────────────────────┐
# │  Dockerfile para Railway.app – TrueEye Flow  │
# └───────────────────────────────────────────────┘

FROM langflowai/langflow:latest

# 1) Directorio de trabajo donde Langflow esperará JSONs
WORKDIR /app

# 2) Incrustamos el descriptor de tu flow
COPY TrueEyeBeta.json /app/TrueEyeBeta.json

# 3) Le decimos a Langflow que cargue ese JSON local
ENV LANGFLOW_BUNDLE_PATHS='["/app/TrueEyeBeta.json"]'

# 4) Railway inyecta $PORT; si no lo hace, asumimos 7860
ENV PORT=${PORT:-7860}

# 5) Documentación del puerto (no afecta runtime)
EXPOSE ${PORT}

# 6) Arrancamos Langflow escuchando en el puerto correcto
CMD ["sh", "-c", "langflow run --host 0.0.0.0 --port ${PORT}"]
