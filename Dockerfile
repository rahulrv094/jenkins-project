FROM python:3.9-slim
COPY app.py /app/app.py
CMD ["python", "/app/app.py"]
