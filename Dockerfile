FROM python:3.11-slim

ENV TZ=Europe/Berlin

# Installiere benötigte Pakete
RUN apt-get update && \
    apt-get install -y cron tzdata && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Wake-on-LAN installieren
RUN pip install wakeonlan

# Dateien kopieren
COPY app /app
COPY crontab.txt /etc/cron.d/wol-cron

# Rechte setzen (nicht mehr crontab!)
RUN chmod 0644 /etc/cron.d/wol-cron

# Cron im Vordergrund starten, Logs in stdout
CMD ["cron", "-f", "-L", "8"]
