#!/bin/bash

export DISPLAY=:100

Xvfb :100 -screen 0 1366x768x24 &

sleep 2

xpra start :100 \
    --bind-tcp=0.0.0.0:${PORT} \
    --html=on \
    --daemon=no \
    --start-child="chromium \
        --no-sandbox \
        --disable-dev-shm-usage \
        --disable-gpu \
        --disable-sync \
        --disable-extensions \
        --disable-background-networking \
        --no-first-run \
        --renderer-process-limit=1 \
        about:blank"
