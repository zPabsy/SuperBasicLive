# SuperBasicLive

1. Script Dasar Streaming : 
ffmpeg -re -stream_loop -1 -i "LOKASI_VIDEO" -c:v copy -c:a copy -f flv rtmp://a.rtmp.youtube.com/live2/GANTI_STREAMKEY_DISINI

2. Streaming Menengah Dengan Script
Menggunakan Script live.sh, start.sh dan stop.sh , jangan lupa ganti privileges (chmod +x *.sh)

3. Streaming Menengah Dengan Script + Crontab


4. Streaming Otomatis Penjadwalan + API + Auto Start & Stop
