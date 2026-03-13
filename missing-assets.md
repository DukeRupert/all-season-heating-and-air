# Missing Assets

Assets referenced in templates but not yet present in `static/`.

## OG Image

- **Path:** `static/images/og-image.jpg`
- **Dimensions:** 1200x630px
- **Purpose:** Social share preview for Facebook, Twitter/X, LinkedIn, iMessage, etc.
- **Content suggestion:** Company logo on navy background with tagline. Keep text large and minimal — most platforms crop or display at small sizes.
- **Referenced in:** `layouts/_default/baseof.html` (og:image, twitter:image)

## Favicon (ICO)

- **Path:** `static/favicon.ico`
- **Dimensions:** 32x32px (can include 16x16 and 48x48 in multi-size .ico)
- **Purpose:** Browser tab icon, bookmark icon, legacy browser support
- **Referenced in:** `layouts/_default/baseof.html`

## Favicon (SVG)

- **Path:** `static/favicon.svg`
- **Purpose:** Modern browsers prefer SVG favicons — scales perfectly at any size and supports dark mode via `prefers-color-scheme` media query in the SVG
- **Referenced in:** `layouts/_default/baseof.html`

## Team Photo

- **Path:** `static/images/team.jpg`
- **Status:** May or may not exist — was previously used only as a CSS background-image, now used as an `<img>` element with `alt` text. Verify it's present.
- **Dimensions:** At least 800px wide, 4:3 aspect ratio preferred
- **Referenced in:** `layouts/index.html` (about section)
