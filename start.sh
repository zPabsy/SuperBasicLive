#!/bin/bash

cd /root/hendri || exit 1
STREAM_KEY="$1"
PID_DIR="pids"
LOG_DIR="logs"

mkdir -p "$PID_DIR" "$LOG_DIR"

if [ -z "$STREAM_KEY" ]; then
  echo "Usage: ./start.sh STREAM_KEY"
  exit 1
fi

PID_FILE="$PID_DIR/$STREAM_KEY.pid"
LOG_FILE="$LOG_DIR/$STREAM_KEY.log"

if [ -f "$PID_FILE" ]; then
  OLD_PID=$(cat "$PID_FILE")
  if ps -p "$OLD_PID" > /dev/null 2>&1; then
    echo "Stream $STREAM_KEY masih berjalan (PID $OLD_PID)"
    exit 1
  else
    rm -f "$PID_FILE"
  fi
fi

# â¬‡ï¸ START FFmpeg dalam process group sendiri
setsid ./live.sh "$STREAM_KEY" > "$LOG_FILE" 2>&1 &

echo $! > "$PID_FILE"

echo "Stream STARTED"
echo "Key : $STREAM_KEY"
echo "PID : $(cat $PID_FILE)"
