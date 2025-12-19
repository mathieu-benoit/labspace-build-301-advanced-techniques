# Main content

```bash
docker build -t python-app .
```

```bash
docker images python-app
```

```bash
docker run -p 8888:8888 python-app
```

:tabLink[This link]{href="http://localhost:8888" title="Python app"}

```bash
docker inspect python-app
```

```bash
docker image history python-app
```

## Copy files

```bash
dive python-app
```

```plaintext save-as=.dockerignore
.env
.git
.github
.labspace
Dockerfile*
*.sh
*.deb
```

```bash
docker build -t python-app:ignore .
```

```bash
dive python-app:ignore
```

```yaml save-as=Dockerfile
FROM python:3.9

ENV PORT=8888

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 8888

CMD ["python", "app.py"]
```

```bash
docker build -t python-app:copy .
```

```bash
dive python-app:copy
```

## Base image

```bash
docker scout quickview python-app:copy
```

[python](https://hub.docker.com/_/python)

```yaml
FROM python:alpine
```

```bash
docker build -t python-app:alpine .
```

`1.5GB` saved on disk!

0 CVEs!

```yaml
FROM python:3.14.2-alpine@sha256:7af51ebeb83610fb69d633d5c61a2efb87efa4caf66b59862d624bb6ef788345
```

```bash
docker build -t python-app:alpine-sha .
```

```bash
docker run -p 8888:8888 python-app:alpine-sha
```

:tabLink[This link]{href="http://localhost:8888" title="Python app"}

DHI: [`dhi.io/python:3.14.2-alpine`](https://hub.docker.com/hardened-images/catalog/dhi/python/images?search=3.14.2-alpine)

```yaml
FROM dhi.io/python:3.14.2-alpine3.22-dev
```

## Multi-stage

```yaml save-as=Dockerfile
FROM dhi.io/python:3.14.2-alpine3.22-dev AS builder
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --target /app

FROM dhi.io/python:3.14.2-alpine3.22
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8888
COPY --from=builder /app /app
COPY app.py /app
EXPOSE 8888
CMD ["python", "/app/app.py"]
```

```bash
docker build -t python-app:dhi-stage .
```

```bash
docker run -p 8888:8888 python-app:dhi-stage
```

```bash
docker scout quickview python-app:dhi-stage
```

```bash
docker scout compare --ignore-unchanged --to python-app:latest python-app:dhi-stage --org demonstrationorg
```