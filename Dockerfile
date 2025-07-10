FROM langflowai/langflow:latest

# Cargar el bundle TrueEyeBeta.json desde GitHub
ENV LANGFLOW_BUNDLE_URLS='["https://raw.githubusercontent.com/DeepRatAI/TE_flowRailway/main/TrueEyeBeta.json"]'

# Exponer el puerto de Langflow
EXPOSE 7860

# Arrancar Langflow en modo producción
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
