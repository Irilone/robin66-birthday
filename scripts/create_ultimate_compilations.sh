#!/bin/bash
# Ultimate Video Compilations - All Best Versions
set -euo pipefail

MEDIA="/Users/air/projects/robin66_site/media"
DIST="/Users/air/projects/robin66_site/dist"

mkdir -p "$DIST"

log() {
  printf '\n🎬 %s\n' "$1"
}

# 1. Ultimate Dog Serenade - Best 2 dog singing videos (skip one without audio)
log "Compiling: Dog Serenade Collection"
ffmpeg -y \
  -i "$MEDIA/robin_lakeside_singing_dog.mp4" \
  -i "$MEDIA/The_dog_sings_202510060615.mp4" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v1]; \
    [0:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a0]; \
    [1:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a1]; \
    [v0][a0][v1][a1]concat=n=2:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k -ar 48000 \
  -movflags +faststart \
  "$DIST/robin66_dog_serenade_collection.mp4"

# 2. Freestyle Tribute Megamix - All freestyle rap versions
log "Compiling: Freestyle Rap Megamix"
ffmpeg -y \
  -i "$MEDIA/Freestyle_rap_artist_202510060617_94mq8.mp4" \
  -i "$MEDIA/Freestyle_rap_artist_202510060617_tw9il.mp4" \
  -i "$MEDIA/Freestyle_rap_artist_202510060617_v6mvw.mp4" \
  -i "$MEDIA/Freestyle_rap_artist_202510060618_e1u9s.mp4" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v3]; \
    [0:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a0]; \
    [1:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a1]; \
    [2:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a2]; \
    [3:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a3]; \
    [v0][a0][v1][a1][v2][a2][v3][a3]concat=n=4:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k -ar 48000 \
  -movflags +faststart \
  "$DIST/robin66_freestyle_megamix.mp4"

# 3. Complete Birthday Celebration - All birthday videos
log "Compiling: Complete Birthday Celebration"
ffmpeg -y \
  -i "$MEDIA/robin_birthday_final_correct.mp4" \
  -i "$MEDIA/New_Birthday_Video_Version.mp4" \
  -i "$MEDIA/Video_Generation_Jolly_Good_Fellow.mp4" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v2]; \
    [0:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a0]; \
    [1:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a1]; \
    [2:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a2]; \
    [v0][a0][v1][a1][v2][a2]concat=n=3:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k -ar 48000 \
  -movflags +faststart \
  "$DIST/robin66_complete_birthday.mp4"

# 4. Historical Epic Extended - Thirty Years War + All Scenes
log "Compiling: Extended Historical Epic"
ffmpeg -y \
  -i "$MEDIA/Thirty_Years_War_Cinematic_Video.mp4" \
  -i "$MEDIA/scene1_final_video.mp4" \
  -i "$MEDIA/scene2_final_video.mp4" \
  -i "$MEDIA/scene3_edict_video.mp4" \
  -i "$MEDIA/Thirty_Years_War_Video_Generation.mp4" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=10,fade=out:st=9:d=1[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v3]; \
    [4:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=10,fade=in:0:20,fade=out:st=9:d=1[v4]; \
    [0:a]atrim=duration=10,afade=out:st=9:d=1[a0]; \
    [1:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a1]; \
    [2:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a2]; \
    [3:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a3]; \
    [4:a]atrim=duration=10,afade=in:st=0:d=0.8,afade=out:st=9:d=1[a4]; \
    [v0][a0][v1][a1][v2][a2][v3][a3][v4][a4]concat=n=5:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 18 \
  -c:a aac -b:a 256k -ar 48000 \
  -movflags +faststart \
  "$DIST/robin66_historical_extended.mp4"

# 5. Musical Moments Montage - Best musical performances
log "Compiling: Musical Moments Montage"
ffmpeg -y \
  -i "$MEDIA/robin_lakeside_singing_dog.mp4" \
  -i "$MEDIA/The_dog_sings_202510060615.mp4" \
  -i "$MEDIA/Freestyle_rap_artist_202510060618_e1u9s.mp4" \
  -i "$MEDIA/Video_Generation_Jolly_Good_Fellow.mp4" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,fade=in:0:20,fade=out:st=7:d=1[v3]; \
    [0:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a0]; \
    [1:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a1]; \
    [2:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a2]; \
    [3:a]afade=in:st=0:d=0.8,afade=out:st=7:d=1[a3]; \
    [v0][a0][v1][a1][v2][a2][v3][a3]concat=n=4:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k -ar 48000 \
  -movflags +faststart \
  "$DIST/robin66_musical_montage.mp4"

log "✅ All ultimate compilations created!"
ls -lh "$DIST"/robin66_*.mp4 | tail -5
