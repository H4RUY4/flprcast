$root = Split-Path -Parent $PSScriptRoot
$cards = Join-Path $root "cards"
$manifest = Join-Path $cards "manifest.json"
$files = Get-ChildItem $cards -File -Include *.png,*.jpg,*.jpeg,*.webp | Sort-Object Name
$list = @()
foreach ($f in $files) {
  $name = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
  $list += [PSCustomObject]@{ name = $name; file = $f.Name; enabled = $true }
}
$list | ConvertTo-Json -Depth 5 | Set-Content -Path $manifest -Encoding UTF8
Write-Host "manifest.json を更新しました。件数: $($list.Count)"
