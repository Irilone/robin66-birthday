# Repository Guidelines

## Project Structure & Module Organization
- `index.html` delivers the single-page experience; keep section anchors and comments for quick navigation.
- `styles.css` holds all presentation rules—extend existing utility classes before adding new selectors.
- Confetti logic, gallery controls, and future scripts live in `script.js`; group related helpers together.
- Generated outputs belong in `dist/`; raw photos and clips stay in `media/` and are not published.
- Automation lives in `scripts/`; run from the project root so the baked-in absolute paths resolve.

## Build, Test, and Development Commands
- `open index.html` previews the site instantly for copy or layout spot checks.
- `python3 -m http.server 8000` serves the build at `http://localhost:8000`, enabling media playback verification.
- `bash scripts/gen_videos.sh` and `bash scripts/generate_collages.sh` rebuild the birthday assets; require FFmpeg and ImageMagick.
- `netlify deploy --prod` pushes the current tree using `netlify.toml`; ensure the Netlify CLI is authenticated first.

## Coding Style & Naming Conventions
- Use 4-space indentation across HTML, CSS, JS, and shell scripts; avoid tabs.
- Prefer lowercase, hyphenated selectors (`hero-banner`, `video-grid`).
- JavaScript should rely on `const`/`let`, single quotes, and early returns for guard clauses.
- In CSS, cluster gradients and keyframes near section headers and document any non-obvious magic numbers inline.

## Testing Guidelines
- No automated suite yet—test at 320px, 768px, and 1280px breakpoints while serving locally.
- After regenerating media, perform a hard refresh or private-window load to bypass cached videos.
- Quick regression pass: confirm confetti performance, video controls, and audio playback on at least one mobile and one desktop browser.

## Commit & Pull Request Guidelines
- Use imperative, present-tense commit subjects (`Add hero collage transitions`) and mention regenerated assets when `dist/` changes.
- Link coordinating requests or issues, list new dependencies, and capture manual QA steps in the PR description.
- Attach before/after screenshots or short clips for any visible change so reviewers can validate quickly.

## Media Generation Tips
- Store large originals in `media/` without committing them unless explicitly requested.
- If you relocate the repository, update the absolute paths in `scripts/` and explain the change in your PR.
