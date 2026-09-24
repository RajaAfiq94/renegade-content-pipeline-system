---
name: design-engine
description: >
  End-to-end AI design system with 190+ battle-tested styles, AI image generation,
  and pixel-perfect export. Designs social media posters, carousels, YouTube thumbnails,
  PDFs, and full websites — entirely from natural language. Includes brand onboarding,
  self-review quality system, Puppeteer export scripts, and 6 teachable design skills.
  Built through 300+ real design experiments.

  Use this skill when the user asks to: design a poster, create social media content,
  build a carousel, make a YouTube thumbnail, generate a PDF/report, design a website
  or landing page, create any visual content, or improve the look of any HTML/CSS.
author: Rahaman Bin Ujit
version: 1.0.0
license: Custom (see LICENSE)
tags:
  - design
  - social-media
  - poster
  - carousel
  - thumbnail
  - pdf
  - website
  - landing-page
  - typography
  - branding
  - ai-image-generation
  - html-css
  - puppeteer
compatible_agents:
  - claude-code
  - cursor
  - codex
  - gemini-cli
  - windsurf
  - copilot
---

# Design Engine

> Created by **Rahaman Bin Ujit** — Built through 300+ design experiments.

An end-to-end AI-powered design system. 190+ styles. AI photo generation. Brand consistency. Self-review quality gates. Pixel-perfect export.

## When to Activate

Use this skill when the user wants to:
- Design a social media post (LinkedIn, Instagram, Twitter/X)
- Create a carousel (multi-slide PDF or PNGs)
- Design a YouTube thumbnail
- Generate a PDF report or document
- Design a website, landing page, or web UI
- Create any visual content with professional quality
- Improve the design/aesthetics of existing HTML/CSS

## First-Time Setup

If `brand.config.json` does NOT exist, run onboarding:
1. Read `onboarding/setup.md`
2. Ask the user every question listed
3. Save answers to `brand.config.json`

**Never design without a brand config.**

## Design Pipeline

```
Brief → Brand Config → Research → Style Selection → AI Photos → HTML/CSS → Self-Review → Export
```

### Step 1: Understand the Brief
- Platform? Format? Content? Mood?

### Step 2: Load Brand
- Read `brand.config.json` for fonts, colors, identity

### Step 3: Choose a Style
- Browse `styles/INDEX.md` (190+ options with complete CSS)

### Step 4: Research References
- Read `workflows/reference-research.md`
- 40% of design time = studying what works in the niche

### Step 5: Generate Photos (if needed)
- Read `workflows/ai-image-generation.md`
- Use Gemini via nano-banana MCP for photo generation/editing

### Step 6: Build in HTML/CSS
- Use the style's CSS as foundation
- Apply brand config values
- Follow `workflows/poster-design.md`, `workflows/carousel-design.md`, or `workflows/website-design.md`

### Step 7: Self-Review (MANDATORY)
- Read `workflows/self-review.md`
- Score must be 4+ before showing
- Check: readability, hierarchy, alignment, color, spacing, brand consistency

### Step 8: Export
- `node scripts/export-png.js` for images
- `node scripts/export-pdf.js` for documents
- `node scripts/export-carousel.js` for multi-slide
- Always 4x resolution, always wait 2500ms for fonts

### Step 9: Open and Show
- Always open the exported file immediately

## Core Principles
1. Think like an art director, not a coder
2. Whitespace is design — when in doubt, add more space
3. One accent color per design, on ONE element
4. Research before creating — never design from imagination
5. Self-review is non-negotiable — score 4+ or fix it
6. The grid is sacred — 8px base units
7. Typography hierarchy — 4:1 headline-to-body ratio minimum
8. Mobile-first — everything is viewed on phones

## Directory Reference

| Path | Purpose |
|---|---|
| `workflows/` | Step-by-step processes for each design type |
| `styles/INDEX.md` | Browse 190+ layout styles |
| `skills/` | Teachable design techniques |
| `knowledge/` | Design theory and platform insights |
| `rules/` | Quality gates and export standards |
| `scripts/` | Puppeteer export tools |
| `templates/` | Starter HTML files |
| `onboarding/setup.md` | Brand setup questions |

## Quick Export Reference

```bash
node scripts/export-png.js design.html output.png 1080 1080     # Square poster
node scripts/export-png.js design.html output.png 1080 1350     # Portrait
node scripts/export-png.js design.html output.png 1280 720      # YouTube thumbnail
node scripts/export-pdf.js document.html output.pdf              # PDF
node scripts/export-carousel.js carousel.html slides/ 1080 1080 # Carousel
```

---

## Running inside the Renegade Plus Producer (unattended, cloud)

These rules override the steps above when the Producer calls this skill from a scheduled run.
All paths are relative to this skill's folder (`.claude/skills/design-engine/`).

1. **No onboarding.** `brand.config.json` is already filled in. Never ask questions.
2. **Brand.** Use `brand.config.json` for colours and fonts. The logo is `assets/logo.png` (white and orange on transparent, for the dark brand background). `assets/logo-on-white.png` is only for light backgrounds.
3. **Fonts.** Google Fonts is blocked in the cloud. In every design, link the local fonts instead:
   `<link rel="stylesheet" href="file:///ABSOLUTE/PATH/TO/.claude/skills/design-engine/assets/fonts/fonts.css">`
   (use the real absolute path from `pwd`). Available: Space Grotesk 700, Inter 300 to 700, Space Mono 400 and 700.
4. **No AI photos.** Skip `workflows/ai-image-generation.md`. No nano-banana or other image generation.
5. **Research.** At most 5 web searches per post.
6. **Size.** 1080 x 1350 portrait for Carousels and Single Images. Each slide is a `.page` div of that size.
7. **Export** with the wrapper, which installs dependencies and handles the cloud browser:
   - Carousel: `bash .claude/skills/design-engine/scripts/export.sh carousel design.html slides/ 1080 1350 1`
   - Single Image: `bash .claude/skills/design-engine/scripts/export.sh png design.html post.png 1080 1350 1`
   Use scale 1 (1080 x 1350 output) so the files are small enough to upload to Google Drive.
8. **Self-review.** Open every exported PNG with the Read tool and check it against `workflows/self-review.md`. Score 4 or higher before handing back. Also confirm every slide is different (no repeated slide 1).
9. **Standards win.** Where this skill conflicts with 01 Standards and Rules in Notion (writing rules, faceless, no prices), the Standards win. Put the Asset Spec text on the slides exactly as written.
