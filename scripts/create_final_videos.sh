#!/bin/bash
# Professional Video Compilation for Robin Wheatley's 66th Birthday
set -e

DIST="/Users/air/projects/robin66_site/dist"
MUSIC="/Users/air/projects/robin66_site/music"

echo "Creating professional birthday videos with classical music..."

# Video 1: Life's Journey (Wagner's Ride of the Valkyries)
echo "📹 Video 1: Life's Journey with Wagner..."
ffmpeg -y \
  -loop 1 -t 4 -i "$DIST/R - 0.jpeg" \
  -loop 1 -t 4 -i "$DIST/R - 1.jpeg" \
  -loop 1 -t 4 -i "$DIST/R - 13.jpeg" \
  -loop 1 -t 4 -i "$DIST/R - 26.jpeg" \
  -loop 1 -t 4 -i "$DIST/R - 27.jpeg" \
  -loop 1 -t 4 -i "$DIST/R - 28.jpeg" \
  -i "$MUSIC/wagner_valkyries.mp3" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30:color=black,fade=out:70:30:color=black[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v3]; \
    [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v4]; \
    [5:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30:color=black[v5]; \
    [v0][v1][v2][v3][v4][v5]concat=n=6:v=1:a=0,format=yuv420p[vout]; \
    [6:a]afade=t=in:st=0:d=2,afade=t=out:st=22:d=2[aout]" \
  -map "[vout]" -map "[aout]" \
  -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 256k \
  -t 24 -movflags +faststart \
  "$DIST/robin66_final_journey.mp4"

# Video 2: Memories & Moments (Beethoven)
echo "📹 Video 2: Memories with Beethoven..."
ffmpeg -y \
  -loop 1 -t 4 -i "$DIST/R - 10.JPG" \
  -loop 1 -t 4 -i "$DIST/R - 15.jpg" \
  -loop 1 -t 4 -i "$DIST/R - 20.JPG" \
  -loop 1 -t 4 -i "$DIST/R - 22.JPG" \
  -loop 1 -t 4 -i "$DIST/R - 25.jpeg" \
  -i "$MUSIC/beethoven_symphony9.mp3" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v3]; \
    [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:70:30[v4]; \
    [v0][v1][v2][v3][v4]concat=n=5:v=1:a=0,format=yuv420p[vout]; \
    [5:a]afade=t=in:st=0:d=2,afade=t=out:st=18:d=2[aout]" \
  -map "[vout]" -map "[aout]" \
  -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 256k \
  -t 20 -movflags +faststart \
  "$DIST/robin66_final_memories.mp4"

# Video 3: Celebration Montage with original video
echo "📹 Video 3: Celebration with original footage..."
ffmpeg -y \
  -i "$DIST/robin_video.mov" \
  -i "$MUSIC/wagner_valkyries.mp3" \
  -filter_complex "[0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,fade=in:0:30,fade=out:st=27:d=3[vout]; \
  [1:a]afade=t=in:st=0:d=2,afade=t=out:st=28:d=2,volume=0.8[aout]" \
  -map "[vout]" -map "[aout]" \
  -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 256k \
  -t 30 -movflags +faststart \
  "$DIST/robin66_final_celebration.mp4"

echo "✅ All professional videos created!"
ls -lh "$DIST"/*.mp4 | grep "robin66_final"
