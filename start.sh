#!/bin/bash
set -e

export PORT=${PORT:-8080}

mkdir -p /tmp/chrome
mkdir -p /run/dbus

# Remove stale X lock files in case of an unclean shutdown
rm -f /tmp/.X100-lock
rm -rf /tmp/.X11-unix/X100

exec xpra start :100 \
    --bind-tcp=0.0.0.0:${PORT} \
    --html=on \
    --daemon=no \
    --mdns=no \
    --notifications=no \
    --pulseaudio=no \
    --printing=no \
    --webcam=no \
    --speaker=off \
    --microphone=off \
    --exit-with-children=no \
    --start-child="chromium \
        --no-sandbox \
        --disable-setuid-sandbox \
        --disable-dev-shm-usage \
        --disable-gpu \
        --disable-software-rasterizer \
        --disable-background-networking \
        --disable-sync \
        --disable-extensions \
        --disable-component-update \
        --disable-default-apps \
        --disable-translate \
        --no-first-run \
        --no-default-browser-check \
        --user-data-dir=/tmp/chrome \
        about:blank"
