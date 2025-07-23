# Usar uma imagem base oficial do Python
FROM python:3.9-slim

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar e instalar as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação
COPY . .

# Definir porta padrão (opcional, mas ajuda localmente)
ENV PORT=8080

# Garantir que a variável $PORT seja interpretada corretamente
#ENTRYPOINT ["sh", "-c"]
#CMD ["gunicorn --bind :$PORT --workers=1 --threads=8 app:app"]
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--workers=1", "--threads=8", "app:app"]