# Dockerfile (trueeye_flow) — Opción 1: carga el bundle directamente desde GitHub

FROM langflowai/langflow:latest

# Indica dónde está tu flujo 
ENV LANGFLOW_BUNDLE_URLS='["https://raw.githubusercontent.com/DeepRatAI/TE_flowRailway/main/TrueEyeBeta.json"]'

# Opcional: deshabilita el login automático (aviso de deprecación en v1.6)
ENV LANGFLOW_SKIP_AUTH_AUTO_LOGIN=true

# Puerto que usará Railway
EXPOSE 7860

# Healthcheck para verificar que Langflow arranque correctamente
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -fs http://localhost:7860/health || exit 1

# Arranca Langflow escuchando en todas las interfaces
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
