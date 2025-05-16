FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive
#ENV JUPYTER_AI_PROVIDER=ollama

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instala jupyterlab, jupyter-ai e o conector do Ollama
RUN pip install --upgrade pip && \
    pip install jupyterlab jupyter-ai langchain-ollama

WORKDIR /workspace

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]
