# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Marketing pitch landing page for **All Season Heating & Air Conditioning** (Helena, MT, est. 1984). Family-owned HVAC company serving Helena, Shelby, and surrounding Montana communities. This is a single-page Hugo static site built as a demo — not the full production architecture.

## Source Materials

- `docs/all-season-brand-guide.md` — color palette, typography (Barlow font), layout spec, voice & tone guidelines, key business details
- `docs/all-season-landing-page-copy.md` — finalized page copy, testimonials, service descriptions, CTAs
- `docs/hugo-site-converter.md` — full conversion agent spec for the eventual production build (Hugo + Go API + Docker + Caddy)

## Build & Development

```bash
# Local dev server (with drafts)
hugo server -D

# Production build
hugo --gc --minify
```

Output goes to `public/` (gitignored).

## Project Structure

```
hugo.toml                     # All business data in [params], menu config
assets/css/main.css           # Single CSS file, custom properties, BEM-lite
content/_index.md             # Homepage (front matter only, layout handles content)
data/services.yaml            # 7 HVAC service entries (looped in template)
data/testimonials.yaml        # 5 testimonials with featured flag (Beth = featured)
layouts/_default/baseof.html  # HTML shell: meta, OG tags, fonts, Hugo Pipes CSS
layouts/index.html            # Landing page: all 8 sections + hamburger JS
layouts/partials/header.html  # Sticky nav with hamburger toggle, menu from config
layouts/partials/footer.html  # Copyright, credentials
layouts/partials/schema.html  # JSON-LD HVACBusiness structured data
```

## Landing Page Sections (in order)

1. **Hero** — split 50/50 (navy text left, placeholder gradient right, image hidden on mobile)
2. **Who We Are** (`#about`) — off-white, centered prose
3. **Services** (`#services`) — navy tint, 2-column grid from `data/services.yaml`
4. **Emergency Callout** — navy, bold "24-hour" statement
5. **Featured Quote** — Beth's testimonial, navy tint
6. **Trust Signals** — 3-column credential grid (est. 1984, A+ BBB, etc.)
7. **Testimonials** — 2-column white card grid from `data/testimonials.yaml`
8. **Contact CTA** (`#contact`) — navy, both phone numbers, mailto CTAs, social links

## Key Conventions

- **Config over code** — All business data in `hugo.toml` `[params]`. Templates use `.Site.Params.*`. Changing info never requires editing templates.
- **Data files for collections** — Services and testimonials in `data/*.yaml`, accessed via `.Site.Data.*`.
- **Single CSS file** — `assets/css/main.css` with CSS custom properties. No frameworks. Hugo Pipes for minification.
- **Zero JS dependencies** — Vanilla JS only, inlined in `{{ define "scripts" }}` block. Currently just hamburger menu toggle.
- **Accessibility** — Skip link, ARIA attributes on nav/toggle, focus-visible outlines, prefers-reduced-motion, semantic HTML.
- **Navigation from config** — `[[menu.main]]` entries in `hugo.toml` with anchor links (`#services`, `#about`, `#contact`).

## Brand Quick Reference

| Role | Hex |
|------|-----|
| Primary (Navy) | `#1e2c5b` |
| Accent (Steel gray) | `#8a9bb5` |
| Background (Off-white) | `#f5f2ee` |
| Section tint (Navy tint) | `#e8ecf5` |
| Body text (Near-black) | `#1a1a1a` |

**Font:** Barlow (Google Fonts) — SemiBold 600 headlines, Medium 500 subheads/labels, Regular 400 body.

**Voice:** Short sentences. Warm but never cute. Montana-specific without cliche. Avoid "world-class," "cutting-edge," "solutions."

## Social Links

- Facebook: https://www.facebook.com/AllSeasonHeatingAir/
- X/Twitter: https://x.com/all_season_heat
- BBB: https://www.bbb.org/us/mt/helena/profile/heating-and-air-conditioning/all-season-heating-ac-1296-64109389
- Current site: https://allseasonheating-air.com
