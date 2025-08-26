# 26. PSReadLine & Eingabeoptimierung

Das Modul **PSReadLine** verbessert die Eingabe in der PowerShell-Konsole. Es bietet Syntax-Highlighting, Autovervollständigung, Verlaufssuche und viele Anpassungsmöglichkeiten.

```powershell
Get-Help -Name 'about_PSReadLine' -ShowWindow
```

## 26.1 Syntax-Highlighting

PSReadLine hebt Befehle, Parameter und Strings farblich hervor. Dadurch wird der Code übersichtlicher.

```powershell
# PSReadLine laden (meist standardmäßig aktiv)
Import-Module PSReadLine

# Farben anpassen
Set-PSReadLineOption -Colors @{ "Command" = "Cyan"; "Parameter" = "Yellow" }
```

## 26.2 Autovervollständigung

Mit Tab lassen sich Cmdlets, Parameter und Dateien automatisch vervollständigen.

```powershell
# Erweiterte Vervollständigung aktivieren
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
```

## 26.3 Verlaufssuche

Die Eingabehistorie kann durchsucht und wiederverwendet werden. So sparst du Zeit bei häufig genutzten Befehlen.

```powershell
# Mit STRG+R Rückwärtssuche im Verlauf starten
# Mit Pfeiltasten durch die History navigieren
```

## 26.4 Tastenkombinationen

Viele Funktionen lassen sich mit Tastenkürzeln aufrufen. Diese können individuell angepasst werden.

```powershell
# Tastenkombination für Clear-Host setzen
Set-PSReadLineKeyHandler -Key Ctrl+l -Function ClearScreen
```

## 26.5 Best Practices

* Farben und Shortcuts an persönliche Vorlieben anpassen.
* Verlauf regelmäßig bereinigen, falls sensible Daten enthalten sind.
* Autovervollständigung mit Plugins wie **Az.Tools.Predictor** erweitern.

```powershell
# Verlauf löschen
Clear-History
Remove-Item (Get-PSReadLineOption).HistorySavePath
```
