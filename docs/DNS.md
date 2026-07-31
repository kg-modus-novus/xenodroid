# xenodroid.ai DNS

Live marketing target:

- https://xenodroid.ai
- https://www.xenodroid.ai
- Vercel fallback URL (set after first deploy)

## GoDaddy records

| Type | Name | Value |
|---|---|---|
| A | `@` | `76.76.21.21` |
| CNAME | `www` | `cname.vercel-dns.com` |

Apply with:

```powershell
$env:GODADDY_API_KEY = "..."
$env:GODADDY_API_SECRET = "..."
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ./scripts/configure-godaddy-dns.ps1
```

## Vercel

- Team: `modus-novus`
- Project: `xenodroid`
- Domains: `xenodroid.ai`, `www.xenodroid.ai`
