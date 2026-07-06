FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    chromium \
    xpra \
    dbus-x11 \
    xauth \
    fonts-liberation \
    fonts-noto \
    ca-certificates \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=8080

EXPOSE 8080

CMD ["/start.sh"]
