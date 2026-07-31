# XenoDroid

Boutique software studio site for **https://xenodroid.ai**.

XenoDroid builds a curated portfolio of customer-facing products at the frontier of AI-assisted development. The through-line: software that helps people help each other.

## Portfolio featured on the site

| Product | Role |
|---|---|
| DecisionPro | Legislative / Medicaid decision support |
| EndPend | Medicaid-pending command center |
| ClassLock | K-12 classroom access control |
| CareSpend | Residential care resident spending |
| ClaimsXen | SNF claims orchestration |
| LoveYou360 | Private family presence |

## Paths

This directory is the website app root and canonical Git repository:
`XenoDroid/dev/website/local repo`.

| Path | Owns |
|---|---|
| `src/` | Astro site |
| `public/` | Static assets (hero, favicons) |
| `docs/` | Deploy / DNS notes |
| `scripts/` | GoDaddy DNS helper |
| `ports.json` | Local reserved ports |

The umbrella project root is `XenoDroid`. Its `docswamp/`, `images/`, and `XenoDroid.code-workspace` remain outside this repository.

## Scriptorium

- **App id:** `xenodroid`
- **Aliases:** XenoDroid, xenodroid.ai
- **Project root:** `XenoDroid`
- **Website app root / Git repository:** `XenoDroid/dev/website/local repo`
- **Ports:** frontend `5060-5069` → http://127.0.0.1:5060

## Local development

```powershell
npm install
npm run dev
```

## Verify

```powershell
npm run build
npm run harness:verify
```

## Deploy

Marketing site deploys to Vercel (team `modus-novus`). Custom domain `xenodroid.ai` is DNS'd at GoDaddy. See [docs/DNS.md](docs/DNS.md).