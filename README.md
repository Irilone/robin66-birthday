# Robin Wheatley's 66th Birthday Celebration Website

Interactive multimedia birthday celebration featuring videos, photo collages, and heartfelt wishes.

## Content Generated

### Videos (3)
- `video1_journey.mp4` - Life Journey (15s, 2.1MB)
- `video2_adventures.mp4` - Adventures (15s, 1.5MB)
- `video3_celebration.mp4` - Celebration (15s, 1.2MB)

### Collages (4)
- `robin66_collage1.jpg` - Early Years (1.2MB)
- `robin66_collage2.jpg` - Adventures (1.0MB)
- `robin66_collage3.jpg` - Celebrations (871KB)
- `robin66_hero_collage.jpg` - Hero Montage (675KB)

## Local Development

Open `index.html` in a browser:
```bash
open index.html
```

Or use a simple server:
```bash
python3 -m http.server 8000
# Visit http://localhost:8000
```

## Deploy to Netlify

### Option 1: Drag & Drop
1. Visit https://app.netlify.com/drop
2. Drag the entire `robin66_site` folder
3. Done! Site is live

### Option 2: Netlify CLI
```bash
npm install -g netlify-cli
netlify deploy --prod
```

### Option 3: Git Integration
```bash
git init
git add .
git commit -m "Robin's 66th birthday site"
gh repo create robin66-birthday --public
git push -u origin main
# Connect repo in Netlify dashboard
```

## Technical Stack

- **Frontend**: Vanilla HTML/CSS/JavaScript
- **Videos**: FFmpeg with photo slideshow transitions
- **Collages**: ImageMagick montage
- **Animation**: Canvas confetti effect
- **Hosting**: Netlify (static site)

## Features

- ✅ Responsive design (mobile-friendly)
- ✅ Confetti animation
- ✅ Video gallery with controls
- ✅ Photo collage grid with hover effects
- ✅ Gradient background
- ✅ Smooth animations
- ✅ Optimized assets

## File Structure

```
robin66_site/
├── index.html          # Main page
├── styles.css          # Styling
├── script.js           # Confetti + interactions
├── netlify.toml        # Deployment config
├── dist/               # Generated media
│   ├── video1_journey.mp4
│   ├── video2_adventures.mp4
│   ├── video3_celebration.mp4
│   ├── robin66_collage1.jpg
│   ├── robin66_collage2.jpg
│   ├── robin66_collage3.jpg
│   └── robin66_hero_collage.jpg
└── scripts/            # Generation scripts
    ├── gen_videos.sh
    └── generate_collages.sh
```

## Credits

Created with love for Robin Wheatley's 66th birthday celebration.
October 5, 2025

## Contributor Guide

See [Repository Guidelines](AGENTS.md) for project structure, coding style, and deployment practices.
