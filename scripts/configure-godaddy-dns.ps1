#Requires -Version 5.1
<#
.SYNOPSIS
  Configure GoDaddy DNS for xenodroid.ai → Vercel.

.ENVIRONMENT
  GODADDY_API_KEY    - GoDaddy API key
  GODADDY_API_SECRET - GoDaddy API secret
#>

$ErrorActionPreference = "Stop"
$domain = "xenodroid.ai"
$key = $env:GODADDY_API_KEY
$secret = $env:GODADDY_API_SECRET

if (-not $key -or -not $secret) {
  Write-Error "Set GODADDY_API_KEY and GODADDY_API_SECRET environment variables."
}

$headers = @{
  Authorization = "sso-key ${key}:${secret}"
  "Content-Type" = "application/json"
}

$records = @(
  @{ type = "A";     name = "@";   data = "76.76.21.21";          ttl = 600 }
  @{ type = "CNAME"; name = "www"; data = "cname.vercel-dns.com"; ttl = 600 }
)

Write-Host "Fetching existing DNS records for $domain..."
$existing = Invoke-RestMethod -Uri "https://api.godaddy.com/v1/domains/$domain/records" -Headers $headers -Method Get

$keep = $existing | Where-Object {
  -not (
    ($_.name -eq "@" -and $_.type -in @("A", "AAAA", "CNAME")) -or
    ($_.name -eq "www" -and $_.type -in @("A", "AAAA", "CNAME"))
  )
}

$merged = @($keep) + @($records)

Write-Host "Updating DNS records..."
$body = $merged | ConvertTo-Json -Depth 4
Invoke-RestMethod -Uri "https://api.godaddy.com/v1/domains/$domain/records" -Headers $headers -Method Put -Body $body

Write-Host "Done. DNS records updated:"
$records | ForEach-Object { Write-Host "  $($_.type) $($_.name) -> $($_.data)" }
Write-Host "Allow 5-30 minutes for propagation, then verify https://xenodroid.ai"
