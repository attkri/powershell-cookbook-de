# 21. Registry und Umgebungsvariablen

PowerShell erlaubt den direkten Zugriff auf Registry und Umgebungsvariablen. Damit lassen sich Systemeinstellungen abfragen und anpassen.

```powershell
Get-Help -Name 'about_Registry' -ShowWindow
```

## 21.1 Registry abfragen

Die Registry wird wie ein Dateisystem behandelt. Mit `Get-Item` oder `Get-ChildItem` lassen sich Schlüssel und Werte anzeigen.

```powershell
# Registry-Schlüssel anzeigen
Get-ChildItem HKLM:\\Software

# Einzelnen Wert auslesen
Get-ItemProperty HKCU:\\Environment | Select-Object PATH
```

## 21.2 Registry ändern

Mit `Set-ItemProperty` können Registry-Werte angepasst oder hinzugefügt werden.

```powershell
# Wert ändern
Set-ItemProperty -Path HKCU:\\Environment -Name TestVar -Value "123"

# Wert hinzufügen
New-ItemProperty -Path HKCU:\\Environment -Name NeueVar -Value "abc" -PropertyType String

# Wert löschen
Remove-ItemProperty -Path HKCU:\\Environment -Name TestVar
```

## 21.3 Umgebungsvariablen lesen

Umgebungsvariablen sind als Provider verfügbar und lassen sich wie ein HashTable abfragen.

```powershell
# Alle Variablen anzeigen
Get-ChildItem Env:

# Einzelne Variable auslesen
$env:PATH
```

## 21.4 Umgebungsvariablen ändern

Variablen können direkt gesetzt werden. Diese Änderungen gelten jedoch nur für die aktuelle Session.

```powershell
# Variable setzen
$env:TestVar = "Hallo"

# Variable wieder entfernen
Remove-Item Env:TestVar
```

## 21.5 Persistente Variablen

Um Variablen dauerhaft zu setzen, müssen sie in der Registry gespeichert oder in Profildateien hinterlegt werden.

```powershell
# Dauerhaft per Registry
Set-ItemProperty -Path HKCU:\\Environment -Name MeineVar -Value "Persistent"

# In Profil-Skript schreiben
Add-Content -Path $PROFILE -Value "$env:MeineVar = 'Persistent'"
```

## 21.6 Best Practices

- Änderungen an Registry und Variablen nur mit Bedacht durchführen.
- Immer Backups oder Wiederherstellungspunkte bereithalten.
- Für Tests besser Session-Variablen statt Registry nutzen.
- Änderungen an PATH und kritischen Variablen sorgfältig prüfen.

```powershell
# Vorsichtiger Test
Set-ItemProperty -Path HKCU:\\Environment -Name TestVar -Value "Demo" -WhatIf
```
