FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Required so `from backend.something import ...` works
ENV PYTHONPATH="${PYTHONPATH}:/app"

CMD ["uvicorn", "backend.app:app", "--host", "0.0.0.0", "--port", "10000"]

