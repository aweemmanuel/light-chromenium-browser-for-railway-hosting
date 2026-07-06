FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    chromium \
    xpra \
    xvfb \
    dbus-x11 \
    xauth \
    ca-certificates \
    fonts-liberation \
    fonts-noto \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=8080

CMD ["/start.sh"]
