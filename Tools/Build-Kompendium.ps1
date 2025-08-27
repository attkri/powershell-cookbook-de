[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = Split-Path $PSCommandPath -Parent | Split-Path -Parent
$source = Join-Path $root 'Kompendium'

# Regex für "Kapitel <Nr> - <Titel>.md"
$rx = '^(?<name>Kapitel\s+(?<nr>\d+)\s*-\s*(?<title>.+))\.md$'

# Kapitel einsammeln und numerisch sortieren
$Kapitel = [System.Collections.ArrayList](Get-ChildItem -Path $source -File -Filter 'Kapitel *.md' -ErrorAction Stop | Where-Object { $_.Name -match $rx } |Sort-Object { [int]([regex]::Match($_.Name, $rx).Groups['nr'].Value) } )

if (-not $Kapitel) {
    throw "Keine Kapiteldateien gefunden unter '$source' (erwartet: 'Kapitel <Nr> - <Titel>.md')."
}

$nl = [Environment]::NewLine
$sb = [System.Text.StringBuilder]::new()

#region Header

$Header = $Kapitel[0] | Get-Content -Raw -Encoding UTF8
$Kapitel.RemoveAt(0)  # Erstes Kapitel (Übersicht) entfernen, da schon im Header
[void]$sb.AppendLine($Header)

#endregion

#region Write TOC

[void]$sb.AppendLine('## Inhaltsverzeichnis')
[void]$sb.AppendLine()

foreach ($f in $Kapitel) {
    $title = ($f | Get-Content -TotalCount 1) -replace '^\#\s+', ''
    
    $link = $title.ToLower()
    $link = $link -replace '\&', ''
    $link = $link -replace '\(', ''
    $link = $link -replace '\)', ''
    $link = $link -replace '\/', ''
    $link = $link -replace '\,', ''
    $link = $link -replace '\.', ''
    $link = $link -replace ' ', '-'

    [void]$sb.AppendLine("- [$title](#$link)")
}
[void]$sb.AppendLine()
Write-Host "TOC geschrieben"

#endregion

#region Kapitel zusammenführen
foreach ($file in $Kapitel) {
    Write-Verbose "Füge hinzu: $($file.Name)"
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # H1-Fallback, wenn Kapitel ohne H1 startet
    if (-not $content.StartsWith('# ')) {
        $base = [regex]::Match($file.BaseName, $rx).Groups['name'].Value
        $content = "# $base$nl$nl$content"
    }
    
    # --- NEU: Überschrift-Ebenen verschieben ---
    # jede Markdown-Überschrift (#...) um ein '#' erweitern
    $content = [regex]::Replace($content, '^(#+)', { "$($args[0].Groups[1].Value)#" }, 'Multiline')
    
    # # MD012: Mehrfach-Blankzeilen reduzieren
    # $content = [regex]::Replace($content, "($nl){3,}", "$nl$nl")
    
    # # MD022: Leerzeile vor/nach H1 sicherstellen
    # $content = [regex]::Replace($content, "([^\r\n])$nl## ", "`$1$nl$nl## ")
    # $content = [regex]::Replace($content, "## (.+?)$nl(?!$nl)", "## `$1$nl$nl")
    
    $content = $content.TrimEnd()
    
    [void]$sb.AppendLine($content)
    [void]$sb.AppendLine()
}
#endregion

# Schreiben
$Output = 'Kompendium.md'
$final = $sb.ToString().TrimEnd()
$final | Set-Content -Path (Join-Path $root $Output) -Encoding UTF8
Write-Host "Masterdatei geschrieben: $(Join-Path $root $Output)"
