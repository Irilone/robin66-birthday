#!/bin/bash
# Simplified FFmpeg Video Compilation for Robin Wheatley's 66th Birthday
# Creates silent videos with photo slideshows and transitions

set -e

MEDIA_DIR="/Users/air/projects/robin66_site/media"
OUTPUT_DIR="/Users/air/projects/robin66_site/dist"

mkdir -p "$OUTPUT_DIR"

# Video 1: Life Journey (photos 0-9)
echo "Creating Video 1: Life Journey (30 seconds)..."
ffmpeg -y \
  -framerate 1/3 \
  -pattern_type glob -i "$MEDIA_DIR/R - [0-5].jpeg" \
  -i "$MEDIA_DIR/R - 6.JPG" \
  -i "$MEDIA_DIR/R - 7.JPG" \
  -i "$MEDIA_DIR/R - 8.JPG" \
  -i "$MEDIA_DIR/R - 9.JPG" \
  -filter_complex \
  "[0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,fade=in:0:15,fade=out:75:15[v0]; \
   [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,fade=in:0:15,fade=out:75:15[v1]; \
   [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,fade=in:0:15,fade=out:75:15[v2]; \
   [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,fade=in:0:15,fade=out:75:15[v3]; \
   [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,fade=in:0:15,fade=out:75:15[v4]; \
   [v0][v1][v2][v3][v4]concat=n=5:v=1:a=0,format=yuv420p,fps=25[out]" \
  -map "[out]" \
  -c:v libx264 -preset medium -crf 23 \
  -t 15 \
  "$OUTPUT_DIR/robin66_video1_life_journey.mp4"

echo "Video 1 complete!"

# Video 2: Adventures (photos 10-19 + MOV)
echo "Creating Video 2: Adventures (30 seconds)..."
ffmpeg -y \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 10.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 11.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 12.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 13.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 14.jpg" \
  -i "$MEDIA_DIR/R - 19.MOV" \
  -filter_complex \
  "[0]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v0]; \
   [1]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v1]; \
   [2]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v2]; \
   [3]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v3]; \
   [4]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v4]; \
   [5:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1,trim=duration=3[v5]; \
   [v0][v1][v2][v3][v4][v5]concat=n=6:v=1:a=0,format=yuv420p[out]" \
  -map "[out]" \
  -c:v libx264 -preset medium -crf 23 \
  "$OUTPUT_DIR/robin66_video2_adventures.mp4"

echo "Video 2 complete!"

# Video 3: Celebration (photos 20-28)
echo "Creating Video 3: Celebration (27 seconds)..."
ffmpeg -y \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 20.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 21.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 22.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 23.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 24.JPG" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 25.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 26.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 27.jpeg" \
  -loop 1 -t 3 -i "$MEDIA_DIR/R - 28.jpeg" \
  -filter_complex \
  "[0]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v0]; \
   [1]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v1]; \
   [2]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v2]; \
   [3]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v3]; \
   [4]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v4]; \
   [5]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v5]; \
   [6]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v6]; \
   [7]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v7]; \
   [8]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:black,setsar=1[v8]; \
   [v0][v1][v2][v3][v4][v5][v6][v7][v8]concat=n=9:v=1:a=0,format=yuv420p[out]" \
  -map "[out]" \
  -c:v libx264 -preset medium -crf 23 \
  "$OUTPUT_DIR/robin66_video3_celebration.mp4"

echo "Video 3 complete!"
echo ""
echo "All videos generated successfully in: $OUTPUT_DIR"
echo "Note: Videos are silent. Add classical music in post-production."
