FROM python:3.11-slim

# Set timezone
ENV TZ=Europe/Berlin

RUN apt-get update && \
    apt-get install -y cron tzdata && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install wakeonlan

COPY app /app
COPY crontab.txt /etc/cron.d/wol-cron

# Set correct permissions and load crontab
RUN chmod 0644 /etc/cron.d/wol-cron && \
    crontab /etc/cron.d/wol-cron

CMD ["cron", "-f"]
