# Dockerfile para Langflow en Railway
FROM langflowai/langflow:latest

# Railway inyecta aquí el puerto en el que debe escuchar
ENV PORT=${PORT:-7860}

EXPOSE ${PORT}

ENTRYPOINT ["sh","-c","langflow run --host 0.0.0.0 --port $PORT"]


