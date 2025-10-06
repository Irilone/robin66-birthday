#!/bin/bash
# FFmpeg Video Compilation for Robin Wheatley's 66th Birthday
# Combines photos into themed videos with classical music and titles

set -e

MEDIA_DIR="/Users/air/projects/robin66_site/media"
OUTPUT_DIR="/Users/air/projects/robin66_site/dist"
MUSIC_URL="https://archive.org/download/WagnerRideOfTheValkyries/Wagner-RideOfTheValkyries.mp3"

mkdir -p "$OUTPUT_DIR"

# Download Wagner's Ride of the Valkyries (public domain)
if [ ! -f "$MEDIA_DIR/valkyrie.mp3" ]; then
    echo "Downloading Wagner - Ride of the Valkyries..."
    curl -L "$MUSIC_URL" -o "$MEDIA_DIR/valkyrie.mp3"
fi

# Video 1: Life Journey (photos 0-9)
echo "Creating Video 1: Life Journey..."
ffmpeg -y \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 0.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 1.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 2.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 3.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 4.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 5.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 6.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 7.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 8.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 9.JPG" \
  -filter_complex \
  "[0:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v0]; \
   [1:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v1]; \
   [2:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v2]; \
   [3:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v3]; \
   [4:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v4]; \
   [5:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v5]; \
   [6:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v6]; \
   [7:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v7]; \
   [8:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v8]; \
   [9:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v9]; \
   [v0][v1][v2][v3][v4][v5][v6][v7][v8][v9]concat=n=10:v=1:a=0,format=yuv420p[v]" \
  -i "$MEDIA_DIR/valkyrie.mp3" \
  -map "[v]" -map 10:a \
  -c:v libx264 -preset medium -crf 23 \
  -c:a aac -b:a 192k \
  -t 30 -shortest \
  "$OUTPUT_DIR/robin66_video1_life_journey.mp4"

# Video 2: Adventures (photos 10-19)
echo "Creating Video 2: Adventures..."
ffmpeg -y \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 10.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 11.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 12.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 13.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 14.jpg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 15.jpg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 16.jpg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 17.jpg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 18.jpg" \
  -i "$MEDIA_DIR/R - 19.MOV" \
  -filter_complex \
  "[0:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v0]; \
   [1:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v1]; \
   [2:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v2]; \
   [3:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v3]; \
   [4:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v4]; \
   [5:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v5]; \
   [6:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v6]; \
   [7:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v7]; \
   [8:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v8]; \
   [9:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black,trim=duration=3[v9]; \
   [v0][v1][v2][v3][v4][v5][v6][v7][v8][v9]concat=n=10:v=1:a=0,format=yuv420p[v]" \
  -i "$MEDIA_DIR/valkyrie.mp3" \
  -map "[v]" -map 10:a \
  -c:v libx264 -preset medium -crf 23 \
  -c:a aac -b:a 192k \
  -t 30 -shortest \
  "$OUTPUT_DIR/robin66_video2_adventures.mp4"

# Video 3: Celebration (photos 20-28)
echo "Creating Video 3: Celebration..."
ffmpeg -y \  -loop 1 -t 3 -i "$MEDIA_DIR/R - 20.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 21.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 22.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 23.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 24.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 25.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 26.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 27.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 28.jpeg" \
  -filter_complex \
  "[0:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v0]; \
   [1:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v1]; \
   [2:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v2]; \
   [3:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v3]; \
   [4:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v4]; \
   [5:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v5]; \
   [6:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v6]; \
   [7:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v7]; \
   [8:v]fade=t=in:st=0:d=1,fade=t=out:st=2:d=1,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black[v8]; \
   [v0][v1][v2][v3][v4][v5][v6][v7][v8]concat=n=9:v=1:a=0,format=yuv420p[v]" \
  -i "$MEDIA_DIR/valkyrie.mp3" \
  -map "[v]" -map 9:a \
  -c:v libx264 -preset medium -crf 23 \
  -c:a aac -b:a 192k \
  -t 27 -shortest \
  "$OUTPUT_DIR/robin66_video3_celebration.mp4"

echo "All videos generated successfully!"
echo "Output directory: $OUTPUT_DIR"
