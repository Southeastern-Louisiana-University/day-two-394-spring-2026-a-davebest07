FROM python:3.13-alpine

COPY main.py .

CMD ["python", "main.py"]   