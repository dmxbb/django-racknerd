FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# ✅ 在这里配置 workers 数量！
CMD ["gunicorn", "--workers", "8", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]