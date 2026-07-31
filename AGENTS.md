# XenoDroid Agent Guide

## Repository boundaries

- **Umbrella project root:** `C:/Augen Studios Dropbox/Ken Greenwood/XenoDroid`
- **Website app root and canonical Git repository:** `C:/Augen Studios Dropbox/Ken Greenwood/XenoDroid/dev/website/local repo`
- **Workspace:** `C:/Augen Studios Dropbox/Ken Greenwood/XenoDroid/XenoDroid.code-workspace`
- **Website ports file:** `C:/Augen Studios Dropbox/Ken Greenwood/XenoDroid/dev/website/local repo/ports.json`

Run Git, npm, and website-focused commands from the website app root. The umbrella root deliberately contains material that is not part of the Git repository:

- `docswamp/` — working notes and spreadsheets
- `images/` — shared project imagery
- `XenoDroid.code-workspace` — multi-root Cursor workspace

Do not move those items into the local repository or add them to its Git history.

## Product context

XenoDroid is an Astro static marketing site for https://xenodroid.ai. It presents a curated portfolio of customer-facing products built around helping people help each other.

- App id: `xenodroid`
- Canonical remote: `https://github.com/kg-modus-novus/xenodroid.git`
- Local frontend range: `5060-5069`
- Default local URL: `http://127.0.0.1:5060`

## Code layout

- `src/` — Astro pages, components, styles, and site content
- `public/` — static assets, hero imagery, and favicons
- `docs/` — deployment and DNS notes
- `scripts/` — GoDaddy DNS helper
- `ports.json` — local reserved ports

## Working conventions

- Preserve the brand-first hero and graphite/copper visual direction.
- Never invent production URLs for ClaimsXen or LoveYou360.
- Avoid reverting or reformatting unrelated changes.
- Keep website documentation and path references relative to the website repository unless a Scriptorium integration requires an umbrella path.

## Verification

After non-trivial website changes, run from the website repository:

```powershell
npm run build
npm run harness:verify
```

Scriptorium tracks both the umbrella workspace and the website repository. Its central configuration lives under `C:/Augen Studios Dropbox/Ken Greenwood/The Scriptorium`.