#!/bin/bash

cd /root/hendri || exit 1
STREAM_KEY="$1"
PID_DIR="pids"

if [ -z "$STREAM_KEY" ]; then
  echo "Usage: ./stop.sh STREAM_KEY"
  exit 1
fi

PID_FILE="$PID_DIR/$STREAM_KEY.pid"

if [ ! -f "$PID_FILE" ]; then
  echo "Stream $STREAM_KEY tidak ditemukan"
  exit 1
fi

PID=$(cat "$PID_FILE")

if ps -p "$PID" > /dev/null 2>&1; then
  # â¬‡ï¸ Kill SELURUH process group
  kill -- -"$PID"
  echo "Stream $STREAM_KEY STOPPED"
else
  echo "Process sudah mati"
fi

rm -f "$PID_FILE"
