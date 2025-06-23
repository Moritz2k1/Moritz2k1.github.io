#!/bin/bash

INPUT="input.mp4"

mkdir -p output/720p output/480p output/360p

echo "Encoding 720p"
ffmpeg -i "$INPUT" -vf "scale=-2:720" -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 23 -sc_threshold 0 -g 48 -keyint_min 48 -hls_time 2 -hls_playlist_type vod -b:v 2800k -maxrate 2996k -bufsize 4200k -b:a 128k -hls_segment_filename "output/720p/segment_%03d.ts" output/720p/index.m3u8

echo "Encoding 480p"
ffmpeg -i "$INPUT" -vf "scale=-2:480" -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 26 -sc_threshold 0 -g 48 -keyint_min 48 -hls_time 2 -hls_playlist_type vod -b:v 1400k -maxrate 1498k -bufsize 2100k -b:a 96k -hls_segment_filename "output/480p/segment_%03d.ts" output/480p/index.m3u8

echo "Encoding 360p"
ffmpeg -i "$INPUT" -vf "scale=-2:360" -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 28 -sc_threshold 0 -g 48 -keyint_min 48 -hls_time 2 -hls_playlist_type vod -b:v 800k -maxrate 856k -bufsize 1200k -b:a 64k -hls_segment_filename "output/360p/segment_%03d.ts" output/360p/index.m3u8
