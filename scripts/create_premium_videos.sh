#!/bin/bash
# Premium Silent Videos for Robin Wheatley's 66th Birthday
set -e

DIST="/Users/air/projects/robin66_site/dist"

echo "Creating premium birthday videos..."

# Video 1: Grand Journey - 6 curated photos, professional transitions
echo "📹 Creating: A Life's Grand Journey..."
ffmpeg -y \
  -loop 1 -t 5 -i "$DIST/R - 0.jpeg" \
  -loop 1 -t 5 -i "$DIST/R - 13.jpeg" \
  -loop 1 -t 5 -i "$DIST/R - 26.jpeg" \
  -loop 1 -t 5 -i "$DIST/R - 27.jpeg" \
  -loop 1 -t 5 -i "$DIST/R - 28.jpeg" \
  -loop 1 -t 5 -i "$DIST/R - 1.jpeg" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40:color=black,fade=out:85:40:color=black[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v3]; \
    [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v4]; \
    [5:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40:color=black[v5]; \
    [v0][v1][v2][v3][v4][v5]concat=n=6:v=1:a=0,format=yuv420p[out]" \
  -map "[out]" \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -movflags +faststart \
  "$DIST/robin66_grand_journey.mp4"

# Video 2: Cherished Moments - 5 selected photos
echo "📹 Creating: Cherished Moments..."
ffmpeg -y \
  -loop 1 -t 5 -i "$DIST/R - 10.JPG" \
  -loop 1 -t 5 -i "$DIST/R - 15.jpg" \
  -loop 1 -t 5 -i "$DIST/R - 20.JPG" \
  -loop 1 -t 5 -i "$DIST/R - 22.JPG" \
  -loop 1 -t 5 -i "$DIST/R - 25.jpeg" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v3]; \
    [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v4]; \
    [v0][v1][v2][v3][v4]concat=n=5:v=1:a=0,format=yuv420p[out]" \
  -map "[out]" \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -movflags +faststart \
  "$DIST/robin66_cherished_moments.mp4"

# Video 3: Original Footage - Professional edit
echo "📹 Processing: Original Birthday Footage..."
ffmpeg -y \
  -i "$DIST/robin_video.mov" \
  -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,fade=in:0:30,fade=out:st=28:d=2" \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -c:a aac -b:a 192k \
  -movflags +faststart \
  -t 30 \
  "$DIST/robin66_celebration.mp4"

echo ""
echo "✅ Premium videos created successfully!"
echo ""
ls -lh "$DIST"/robin66_*.mp4
