FROM python:3.9

ENV PORT 8888

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

CMD ["python", "app.py"]