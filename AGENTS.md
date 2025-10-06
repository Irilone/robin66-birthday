# Repository Guidelines

## Project Structure & Module Organization
The live site is driven by `index.html`, `styles.css`, and `script.js`; keep sections aligned with ARIA landmarks already in the markup. Media sources remain under `media/` and looping audio under `music/`; do not export processed assets there. Generated bundles land in `dist/`, which mirrors the Netlify publish directory. Automation lives in `scripts/`, grouped by workflow (e.g., `generate_videos.sh`, `create_elegant_collages.sh`); run them from the repository root to honor absolute paths. Deploy settings are shared via `netlify.toml`.

## Build, Test, and Development Commands
Use `python3 -m http.server 8080` for a quick local preview at `http://localhost:8080`. Rebuild media suites with `bash scripts/generate_videos.sh` or targeted runs such as `bash scripts/create_final_videos.sh`; both require FFmpeg and ImageMagick installed on PATH. Authenticate `netlify login` once, then `netlify deploy --prod` publishes the contents of `dist/`. For asset-only updates, `netlify deploy --dir=dist` avoids rerunning the build pipeline.

## Coding Style & Naming Conventions
Follow 2-space indentation in HTML and CSS, and 2-space soft tabs in JavaScript to match existing files. Use kebab-case for CSS classes and lowercase hyphenated file names (`birthday-gallery.jpg`). Prefer `const`/`let`, arrow functions, and early returns for guards. Document non-obvious magic numbers with inline comments and group related CSS rules with header comments already present.

## Testing Guidelines
Manual QA covers responsive checks at 320px, 768px, and 1280px while serving locally. Verify video playback controls, background audio toggle, and confetti animation on at least one Chromium and one WebKit browser. After running media scripts, clear browser cache or use a private window to pull fresh assets. Log issues in `README.md` if they block deployment.

## Commit & Pull Request Guidelines
Write present-tense commit subjects (`Update hero confetti timing`) and include context on regenerated artifacts (e.g., “regen dist/ + new video cuts”). PRs should summarize user-visible changes, note any scripts executed, and attach screenshots or short clips showing responsive states. Link relevant tasks or Netlify deploy previews, and call out outstanding QA steps before requesting review.

## Security & Configuration Tips
Respect the scoped MCP allow-list by keeping Netlify automation inside `/Users/air/projects/robin66_site/`. Do not commit large uncompressed originals; stash them outside the repo or track via cloud storage. Review `netlify_robin66.json` before extending permissions and document any new commands added to the allow list.
