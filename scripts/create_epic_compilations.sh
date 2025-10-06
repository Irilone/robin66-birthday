#!/bin/bash
# Epic Video Compilations from Generated Content
set -e

MEDIA="/Users/air/projects/robin66_site/media"
DIST="/Users/air/projects/robin66_site/dist"

echo "Creating epic video compilations..."

# Video 1: Historical Epic - Thirty Years War + Scenes
echo "🎬 Epic 1: The Historical Journey..."
ffmpeg -y \
  -i "$MEDIA/Thirty_Years_War_Cinematic_Video.mp4" \
  -i "$MEDIA/scene1_final_video.mp4" \
  -i "$MEDIA/scene2_final_video.mp4" \
  -i "$MEDIA/scene3_edict_video.mp4" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=15,fade=out:st=14:d=1[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=12,fade=in:0:30,fade=out:st=11:d=1[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=12,fade=in:0:30,fade=out:st=11:d=1[v2]; \
    [3:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=12,fade=in:0:30,fade=out:st=11:d=1[v3]; \
    [0:a]atrim=duration=15,afade=out:st=14:d=1[a0]; \
    [1:a]atrim=duration=12,afade=in:st=0:d=1,afade=out:st=11:d=1[a1]; \
    [2:a]atrim=duration=12,afade=in:st=0:d=1,afade=out:st=11:d=1[a2]; \
    [3:a]atrim=duration=12,afade=in:st=0:d=1,afade=out:st=11:d=1[a3]; \
    [v0][a0][v1][a1][v2][a2][v3][a3]concat=n=4:v=1:a=1[outv][outa]" \
  -map "[outv]" -map "[outa]" \
  -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 256k \
  -movflags +faststart \
  "$DIST/robin66_historical_epic.mp4"

# Video 2: Birthday Celebration - Best birthday videos
echo "🎬 Epic 2: Birthday Celebration..."
ffmpeg -y \
  -i "$MEDIA/robin_birthday_final_correct.mp4" \
  -i "$MEDIA/New_Birthday_Video_Version.mp4" \
  -i "$MEDIA/Video_Generation_Jolly_Good_Fellow.mp4" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=15,fade=out:st=14:d=1[v0]; \
    [1:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=12,fade=in:0:30,fade=out:st=11:d=1[v1]; \
    [2:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1,trim=duration=12,fade=in:0:30,fade=out:st=11:d=1[v2]; \
    [0:a]atrim=duration=15,afade=out:st=14:d=1[a0]; \
    [1:a]atrim=duration=12,afade=in:st=0:d=1,afade=out:st=11:d=1[a1]; \
    [2:a]atrim=duration=12,afade=in:st=0:d=1,afade=out:st=11:d=1[a2]; \
    [v0][a0][v1][a1][v2][a2]concat=n=3:v=1:a=1[outv][outa]" \
  -map "[outv]" -map "[outa]" \
  -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 256k \
  -movflags +faststart \
  "$DIST/robin66_birthday_compilation.mp4"

# Video 3: Lakeside Serenade - The singing dog
echo "🎬 Epic 3: Lakeside Serenade..."
ffmpeg -y \
  -i "$MEDIA/robin_lakeside_singing_dog.mp4" \
  -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,fade=in:0:30,fade=out:st=28:d=2" \
  -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 256k \
  -movflags +faststart \
  -t 30 \
  "$DIST/robin66_lakeside_serenade.mp4"

# Video 4: Thirty Years War - Best version
echo "🎬 Epic 4: Thirty Years War..."
ffmpeg -y \
  -i "$MEDIA/Thirty_Years_War_Video_Generation.mp4" \
  -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,fade=in:0:30,fade=out:st=28:d=2" \
  -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 256k \
  -movflags +faststart \
  -t 30 \
  "$DIST/robin66_thirty_years_war.mp4"

echo ""
echo "✅ Epic compilations created!"
ls -lh "$DIST"/robin66_historical*.mp4 "$DIST"/robin66_birthday_compilation.mp4 "$DIST"/robin66_lakeside*.mp4 "$DIST"/robin66_thirty*.mp4
