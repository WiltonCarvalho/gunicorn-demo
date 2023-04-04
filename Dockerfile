FROM ubuntu:22.04
ENV PATH $PATH:/app/.local/bin
ENV TZ America/Sao_Paulo
RUN set -ex \
  && apt-get -q update \
  && apt-get -q -y install --no-install-recommends \
    tzdata ca-certificates curl python3-minimal python3-pip python3-venv \
  && rm -rf /var/lib/apt/lists/* \
  && useradd --uid=1000 -g root -d /app -s /bin/bash app \
  && mkdir -p --mode=0770 /app \
  && chown app:root /app
USER app:root
WORKDIR /app
COPY requirements.txt .
RUN set -ex \
  && pip3 install -r requirements.txt --no-cache-dir --no-deps \
  && gunicorn --version
COPY hello.py .
CMD exec gunicorn hello:app --workers ${WORKERS:-2} --bind 0.0.0.0:5000 --umask 0007 --access-logfile -
EXPOSE 5000
