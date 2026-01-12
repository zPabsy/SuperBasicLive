# SuperBasicLive

# >> SCRIPT DISINI UNTUK BELAJAR LIVE BASIC VIA LINUX SECARA FULL MANUAL SETUP TAPI AUTO JALAN SEMUA, BISA DIKEMBANGKAN LEBIH LANJUT MENGGUNAKAN PYTHON FLASK ATAU LAINNYA

## Sebelum lanjut, pastikan :
- Sesuaikan DATETIME di Server VPS
>sudo timedatectl set-timezone Asia/Jakarta
- Install FFMPEG
> sudo apt install ffmpeg
- Install Python & PIP
>sudo apt install python3 python3-pip
- Install Google API Library
>pip install --upgrade google-auth google-auth-oauthlib google-api-python-client --break-system-packages

## 1. Script Dasar Streaming : 
```sh
ffmpeg -re -stream_loop -1 -i "LOKASI_VIDEO" -c:v copy -c:a copy -f flv rtmp://a.rtmp.youtube.com/live2/GANTI_STREAMKEY_DISINI
```


## 2. Streaming Menengah Dengan Script
Menggunakan Script [live.sh](https://github.com/zPabsy/SuperBasicLive/blob/main/basic/live.sh), [start.sh](https://github.com/zPabsy/SuperBasicLive/blob/main/basic/start.sh) dan [stop.sh](https://github.com/zPabsy/SuperBasicLive/blob/main/basic/stop.sh) , jangan lupa ganti privileges (chmod +x *.sh)



## 3. Streaming Menengah Dengan Script + Crontab
Script :
```sh
 * * * * * /lokasi/script.sh STREAM_KEY
```

Contoh start.sh di /root/hendri dan stream key:
```sh
10 22 * * * /root/hendri/start.sh aaaa-bbbb-cccc-dddd 
```
Script diatas akan menjalankan start.sh dengan key stream aaaa-bbbb-cccc-dddd di jam 22.10 (waktu server) setiap hari

## 4. Streaming Otomatis Penjadwalan + API + Auto Start & Stop

Contoh Folder & File Tree :
├── client_secret.json
├── config.json
├── schedule.py
├── start.py
├── stop.py
├── streamid.py
├── token.json
└── video              <------ folder

Di dalam folder video, isi nama file video dan thumbnail dengan nama yang sama (contoh 1.mp4 dan 1.jpg)

- client_secret.json : client secret dari Google API
- config.json : konfigurasi metadata untuk video dan thumbnail, ada index terhitung dari 0
- schedule.py : script untuk penjadwalan livestream
- start.py : script untuk start streaming
- stop.py : script untuk stop streaming
- streamid.py : mendapat list stream id untuk memakai stream key nanti
- token.json : credential token dari client secret untuk akses streaming dll

Notes : pastikan semua ada dalam satu folder dan periksa setiap schedule.py, start.py dan stop.py karena perlu edit lokasi.

Crontab contoh untuk jadwal otomatis, start & stop otomatis 
```sh
29 15 * * * /usr/bin/python3 /root/live/schedule.py 0
30 15 * * * /usr/bin/python3 /root/live/start.py g4qe-4m6v-2b85-d7x3-19f1 /root/live/video/1.mp4
35 15 * * * /usr/bin/python3 /root/live/stop.py g4qe-4m6v-2b85-d7x3-19f1
```
- Script diatas, jam 15.29 akan menjalankan penjadwalan, membuat jadwal streaming sesuai file di config.json.
- Kemudian jam 15.30 akan menjalankan streaming dengan streamkey g4qe-4m6v-2b85-d7x3-19f1 dengan file 1.mp4 di direktori /root/live/video
- Di jam 15.35 streaming akan stop

Untuk duplikasi atau multi streaming tinggal copas 3 script diatas dan disesuaikan.
