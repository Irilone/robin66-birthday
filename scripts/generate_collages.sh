#!/bin/bash
# ImageMagick Collage Generation for Robin's 66th Birthday

set -e

MEDIA_DIR="/Users/air/projects/robin66_site/media"
OUTPUT_DIR="/Users/air/projects/robin66_site/dist"

mkdir -p "$OUTPUT_DIR"

# Collage 1: 3x3 grid (photos 0-8)
echo "Creating Collage 1: Early Years..."
montage "$MEDIA_DIR/R - 0.jpeg" "$MEDIA_DIR/R - 1.jpeg" "$MEDIA_DIR/R - 2.jpeg" \
        "$MEDIA_DIR/R - 3.jpeg" "$MEDIA_DIR/R - 4.jpeg" "$MEDIA_DIR/R - 5.jpeg" \
        "$MEDIA_DIR/R - 6.JPG" "$MEDIA_DIR/R - 7.JPG" "$MEDIA_DIR/R - 8.JPG" \
        -tile 3x3 -geometry 640x480+10+10 -background '#2c1810' \
        -title "Robin's Journey" -pointsize 48 -fill white \
        "$OUTPUT_DIR/robin66_collage1.jpg"

# Collage 2: 3x3 grid (photos 9-17)
echo "Creating Collage 2: Adventures..."
montage "$MEDIA_DIR/R - 9.JPG" "$MEDIA_DIR/R - 10.JPG" "$MEDIA_DIR/R - 11.JPG" \
        "$MEDIA_DIR/R - 12.JPG" "$MEDIA_DIR/R - 13.jpeg" "$MEDIA_DIR/R - 14.jpg" \
        "$MEDIA_DIR/R - 15.jpg" "$MEDIA_DIR/R - 16.jpg" "$MEDIA_DIR/R - 17.jpg" \
        -tile 3x3 -geometry 640x480+10+10 -background '#1a2332' \
        -title "Travels & Memories" -pointsize 48 -fill white \
        "$OUTPUT_DIR/robin66_collage2.jpg"

# Collage 3: 3x3 grid (photos 18-26)
echo "Creating Collage 3: Celebrations..."
montage "$MEDIA_DIR/R - 18.jpg" "$MEDIA_DIR/R - 20.JPG" "$MEDIA_DIR/R - 21.JPG" \
        "$MEDIA_DIR/R - 22.JPG" "$MEDIA_DIR/R - 23.JPG" "$MEDIA_DIR/R - 24.JPG" \
        "$MEDIA_DIR/R - 25.jpeg" "$MEDIA_DIR/R - 26.jpeg" "$MEDIA_DIR/R - 27.jpeg" \
        -tile 3x3 -geometry 640x480+10+10 -background '#1e1e1e' \
        -title "Happy 66th Birthday!" -pointsize 48 -fill gold \
        "$OUTPUT_DIR/robin66_collage3.jpg"

# Collage 4: Large hero image
echo "Creating Collage 4: Hero Montage..."
montage "$MEDIA_DIR/R - 0.jpeg" "$MEDIA_DIR/R - 13.jpeg" "$MEDIA_DIR/R - 26.jpeg" "$MEDIA_DIR/R - 28.jpeg" \
        -tile 2x2 -geometry 960x720+5+5 -background black \
        "$OUTPUT_DIR/robin66_hero_collage.jpg"

echo "All collages generated successfully!"
