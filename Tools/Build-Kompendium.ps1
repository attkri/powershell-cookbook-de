[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Install-Pandoc {
    winget install --id JohnMacFarlane.Pandoc
    winget install MiKTeX
}

#region Vorbereitung

Remove-Item -Path '.\Kompendium.log', '.\Kompendium.pdf' -Force -ErrorAction Ignore

$source = '.\Kompendium'

# Regex für "Kapitel <Nr> - <Titel>.md"
$rx = '^(?<name>Kapitel\s+(?<nr>\d+)\s*-\s*(?<title>.+))\.md$'

# Kapitel einsammeln und numerisch sortieren
$Kapitel = [System.Collections.ArrayList](Get-ChildItem -Path $source -File -Filter 'Kapitel *.md' -ErrorAction Stop | Where-Object { $_.Name -match $rx } | Sort-Object { [int]([regex]::Match($_.Name, $rx).Groups['nr'].Value) } )

if (-not $Kapitel) {
    throw "Keine Kapiteldateien gefunden unter '$source' (erwartet: 'Kapitel <Nr> - <Titel>.md')."
}

$nl = [Environment]::NewLine
$sb = [System.Text.StringBuilder]::new()
"Vorbereitung abgeschlossen" | Write-Host -ForegroundColor Cyan
#endregion

#region Header einfügen

$Header = $Kapitel[0] | Get-Content -Raw -Encoding UTF8
$Kapitel.RemoveAt(0)  # Erstes Kapitel (Übersicht) entfernen, da schon im Header
[void]$sb.AppendLine($Header)
"Header angefügt" | Write-Host -ForegroundColor Cyan

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
"Kapitel zusammenführen" | Write-Host -ForegroundColor Cyan
#endregion

#region Schreiben Kompendium.md

$final = $sb.ToString().TrimEnd()
$final | Set-Content -Path '.\Kompendium.md' -Encoding UTF8
"Kompendium.md geschrieben" | Write-Host -ForegroundColor Cyan

#endregion

#region PDF mit Pandoc erzeugen

'Starte Kompendium.pdf erzeugen ...' | Write-Host -ForegroundColor Cyan
Start-Sleep -Seconds 2 # Warte auf Dateisystem
Pandoc.exe .\Kompendium.md --output=.\Kompendium.pdf --defaults=.\Tools\PandocDefaultOptionSettings.yaml -V block-headings --log .\Kompendium.log
'... Kompendium.pdf geschrieben' | Write-Host -ForegroundColor Cyan

#endregion

<#
Pandoc --list-highlight-languages

#>



