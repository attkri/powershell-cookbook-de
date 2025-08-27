[CmdletBinding()]
param(
[Parameter()] [string]$Output = 'Kompendium.md',
[Parameter()] [string]$Title = '# PowerShell meistern — Kompendium' ,
[Parameter()] [string]$Intro = 'Dieses Dokument fasst alle Kapitel in einem PDF zusammen.'
)


Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'


# Alle Kapitel in numerischer Reihenfolge sammeln
$kapitel = Get-ChildItem -File -Filter 'Kapitel_*.md' |
Where-Object { $_.Name -match '^Kapitel_(\d+)\.md$' } |
Sort-Object { [int]($Matches[1]) }


if (-not $kapitel) { throw 'Keine Kapiteldateien gefunden (Kapitel_*.md).' }


# Masterdokument zusammenstellen
$nl = [Environment]::NewLine
$sb = [System.Text.StringBuilder]::new()
[void]$sb.AppendLine($Title)
[void]$sb.AppendLine()
[void]$sb.AppendLine($Intro)
[void]$sb.AppendLine()
[void]$sb.AppendLine('---')
[void]$sb.AppendLine()


foreach ($file in $kapitel) {
Write-Verbose "Füge hinzu: $($file.Name)"
$content = Get-Content -Path $file.FullName -Raw -Encoding UTF8


# Sicherstellen: H1 bleibt H1, davor Leerzeile
if (-not $content.StartsWith('# ')) {
# Wenn das Kapitel kein H1 hat, füge Dateiname als Fallback ein
$content = "# $($file.BaseName)$nl$nl$content"
}


# Trennzeile
[void]$sb.AppendLine($content.TrimEnd())
[void]$sb.AppendLine()
[void]$sb.AppendLine('')
}


$sb.ToString() | Set-Content -Path $Output -Encoding UTF8
Write-Host "Masterdatei geschrieben: $Output"