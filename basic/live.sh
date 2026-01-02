#!/bin/bash

STREAM_KEY="$1"
VIDEO="1.mp4"

if [ -z "$STREAM_KEY" ]; then
  echo "Stream key kosong!"
  exit 1
fi

ffmpeg -re -stream_loop -1 -i "$VIDEO" \
-c:v copy -c:a copy \
-f flv rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY

