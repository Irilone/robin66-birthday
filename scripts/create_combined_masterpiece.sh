#!/bin/bash
# Create Combined Masterpiece Videos
set -e

DIST="/Users/air/projects/robin66_site/dist"

echo "Creating combined masterpiece videos..."

# Combined Video 1: Ultimate Journey - Best photos in sequence
echo "🎬 Creating: Ultimate Journey..."
ffmpeg -y \
  -loop 1 -t 6 -i "$DIST/R - 0.jpeg" \
  -loop 1 -t 6 -i "$DIST/R - 1.jpeg" \
  -loop 1 -t 6 -i "$DIST/R - 13.jpeg" \
  -loop 1 -t 6 -i "$DIST/R - 15.jpg" \
  -loop 1 -t 6 -i "$DIST/R - 20.JPG" \
  -loop 1 -t 6 -i "$DIST/R - 22.JPG" \
  -loop 1 -t 6 -i "$DIST/R - 25.jpeg" \
  -loop 1 -t 6 -i "$DIST/R - 26.jpeg" \
  -loop 1 -t 6 -i "$DIST/R - 27.jpeg" \
  -loop 1 -t 6 -i "$DIST/R - 28.jpeg" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v3]; \
    [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v4]; \
    [5:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v5]; \
    [6:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v6]; \
    [7:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v7]; \
    [8:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v8]; \
    [9:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:45,fade=out:105:45[v9]; \
    [v0][v1][v2][v3][v4][v5][v6][v7][v8][v9]concat=n=10:v=1:a=0,format=yuv420p[out]" \
  -map "[out]" \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -movflags +faststart \
  "$DIST/robin66_ultimate_journey.mp4"

# Combined Video 2: Complete Celebration - Mix of photos and original footage
echo "🎬 Creating: Complete Celebration..."
# First create a trimmed version of the original video
ffmpeg -y -i "$DIST/robin_video.mov" \
  -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black" \
  -c:v libx264 -preset fast -crf 22 -an \
  -t 10 \
  "$DIST/temp_original.mp4"

# Now combine with photos
ffmpeg -y \
  -loop 1 -t 5 -i "$DIST/R - 10.JPG" \
  -loop 1 -t 5 -i "$DIST/R - 11.JPG" \
  -loop 1 -t 5 -i "$DIST/R - 12.JPG" \
  -i "$DIST/temp_original.mp4" \
  -loop 1 -t 5 -i "$DIST/R - 16.jpg" \
  -loop 1 -t 5 -i "$DIST/R - 17.jpg" \
  -loop 1 -t 5 -i "$DIST/R - 18.jpg" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v2]; \
    [3:v]setsar=1,fade=in:0:30,fade=out:st=9.5:d=0.5[v3]; \
    [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v4]; \
    [5:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v5]; \
    [6:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:40,fade=out:85:40[v6]; \
    [v0][v1][v2][v3][v4][v5][v6]concat=n=7:v=1:a=0,format=yuv420p[out]" \
  -map "[out]" \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -movflags +faststart \
  "$DIST/robin66_complete_celebration.mp4"

# Cleanup
rm -f "$DIST/temp_original.mp4"

echo ""
echo "✅ Combined masterpiece videos created!"
ls -lh "$DIST"/robin66_ultimate*.mp4 "$DIST"/robin66_complete*.mp4
