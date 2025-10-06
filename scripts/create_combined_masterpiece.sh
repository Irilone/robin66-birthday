#!/bin/bash
# Compose highlight reels from the strongest video takes in media/
set -euo pipefail

MEDIA_DIR="/Users/air/projects/robin66_site/media"
DIST_DIR="/Users/air/projects/robin66_site/dist"

mkdir -p "$DIST_DIR"

log() {
  printf '\n==> %s\n' "$1"
}

log "Rendering story reel: Prague sunrise to birthday toast"
ffmpeg -y \
  -i "$MEDIA_DIR/scene1_final_video.mp4" \
  -i "$MEDIA_DIR/scene2_final_video.mp4" \
  -i "$MEDIA_DIR/scene3_edict_video.mp4" \
  -i "$MEDIA_DIR/robin_birthday_final_correct.mp4" \
  -filter_complex "\
    [0:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v0]; \
    [1:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v1]; \
    [2:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v2]; \
    [3:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v3]; \
    [v0][0:a][v1][1:a][v2][2:a][v3][3:a]concat=n=4:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k -ar 48000 \
  -movflags +faststart \
  "$DIST_DIR/robin66_story_reel.mp4"

log "Rendering performance reel: lakeside serenades and freestyle tributes"
ffmpeg -y \
  -i "$MEDIA_DIR/robin_lakeside_singing_dog.mp4" \
  -i "$MEDIA_DIR/The_dog_sings_202510060615.mp4" \
  -i "$MEDIA_DIR/Freestyle_rap_artist_202510060618_e1u9s.mp4" \
  -i "$MEDIA_DIR/Video_Generation_Jolly_Good_Fellow.mp4" \
  -filter_complex "\
    [0:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v0]; \
    [1:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v1]; \
    [2:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v2]; \
    [3:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1[v3]; \
    [v0][0:a][v1][1:a][v2][2:a][v3][3:a]concat=n=4:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k -ar 48000 \
  -movflags +faststart \
  "$DIST_DIR/robin66_performance_reel.mp4"

log "Highlight reels ready in $DIST_DIR"
ls -lh "$DIST_DIR"/robin66_*_reel.mp4
