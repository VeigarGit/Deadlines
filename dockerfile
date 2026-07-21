# Dockerman Deadline System
FROM python:3.12-slim

LABEL maintainer="Dockerman"
LABEL description="Sistema de deadlines com contagem regressiva contínua"

WORKDIR /app

COPY app.py .
COPY public/ ./public/

RUN mkdir -p /app/data

ENV PORT=8000
ENV DATA_DIR=/app/data

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/')" || exit 1

CMD ["python", "app.py"]