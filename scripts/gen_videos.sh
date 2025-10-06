#!/bin/bash
set -e
MEDIA="/Users/air/projects/robin66_site/media"
OUT="/Users/air/projects/robin66_site/dist"
mkdir -p "$OUT"

echo "Video 1: Life Journey..."
ffmpeg -y -loop 1 -t 3 -i "$MEDIA/R - 0.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 1.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 2.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 3.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 4.jpeg" \
-filter_complex "[0]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v0]; \
[1]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v1]; \
[2]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v2]; \
[3]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v3]; \
[4]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v4]; \
[v0][v1][v2][v3][v4]concat=n=5:v=1:a=0,format=yuv420p[out]" \
-map "[out]" -c:v libx264 -preset fast -crf 23 \
"$OUT/video1_journey.mp4"

echo "Video 2: Adventures..."
ffmpeg -y -loop 1 -t 3 -i "$MEDIA/R - 10.JPG" \
-loop 1 -t 3 -i "$MEDIA/R - 11.JPG" \
-loop 1 -t 3 -i "$MEDIA/R - 12.JPG" \
-loop 1 -t 3 -i "$MEDIA/R - 15.jpg" \
-loop 1 -t 3 -i "$MEDIA/R - 16.jpg" \
-filter_complex "[0]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v0]; \
[1]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v1]; \
[2]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v2]; \
[3]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v3]; \
[4]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v4]; \
[v0][v1][v2][v3][v4]concat=n=5:v=1:a=0,format=yuv420p[out]" \
-map "[out]" -c:v libx264 -preset fast -crf 23 \
"$OUT/video2_adventures.mp4"

echo "Video 3: Celebration..."
ffmpeg -y -loop 1 -t 3 -i "$MEDIA/R - 25.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 26.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 27.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 28.jpeg" \
-loop 1 -t 3 -i "$MEDIA/R - 0.jpeg" \
-filter_complex "[0]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v0]; \
[1]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v1]; \
[2]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v2]; \
[3]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v3]; \
[4]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1[v4]; \
[v0][v1][v2][v3][v4]concat=n=5:v=1:a=0,format=yuv420p[out]" \
-map "[out]" -c:v libx264 -preset fast -crf 23 \
"$OUT/video3_celebration.mp4"

echo "Done! 3 videos created in $OUT"
