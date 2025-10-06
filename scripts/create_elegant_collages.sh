#!/bin/bash
# Elegant Photo Collages for Robin Wheatley
set -e

DIST="/Users/air/projects/robin66_site/dist"

echo "Creating elegant photo collages..."

# Collage 1: Life's Tapestry (3x3 classic grid)
echo "🎨 Collage 1: Life's Tapestry..."
montage "$DIST/R - 0.jpeg" "$DIST/R - 1.jpeg" "$DIST/R - 13.jpeg" \
        "$DIST/R - 15.jpg" "$DIST/R - 20.JPG" "$DIST/R - 25.jpeg" \
        "$DIST/R - 26.jpeg" "$DIST/R - 27.jpeg" "$DIST/R - 28.jpeg" \
        -tile 3x3 -geometry 640x480+5+5 \
        -background '#2c2424' -bordercolor '#d4af37' -border 2 \
        "$DIST/robin66_tapestry.jpg"

# Collage 2: Moments in Time (2x2 large format)
echo "🎨 Collage 2: Moments in Time..."
montage "$DIST/R - 10.JPG" "$DIST/R - 22.JPG" \
        "$DIST/R - 26.jpeg" "$DIST/R - 28.jpeg" \
        -tile 2x2 -geometry 960x720+10+10 \
        -background '#1a1818' -bordercolor '#d4af37' -border 3 \
        "$DIST/robin66_moments.jpg"

# Collage 3: Heritage Strip (panoramic)
echo "🎨 Collage 3: Heritage Panorama..."
montage "$DIST/R - 0.jpeg" "$DIST/R - 13.jpeg" "$DIST/R - 26.jpeg" "$DIST/R - 27.jpeg" "$DIST/R - 28.jpeg" \
        -tile 5x1 -geometry 480x640+5+5 \
        -background '#3a2828' -bordercolor '#d4af37' -border 2 \
        "$DIST/robin66_heritage.jpg"

# Collage 4: Feature Portrait (single large with border)
echo "🎨 Collage 4: Feature Portrait..."
convert "$DIST/R - 0.jpeg" \
        -resize 1920x1080^ -gravity center -extent 1920x1080 \
        -bordercolor '#d4af37' -border 20 \
        -bordercolor '#2c2424' -border 40 \
        "$DIST/robin66_portrait.jpg"

echo "✅ Elegant collages created!"
ls -lh "$DIST"/robin66_*.jpg
