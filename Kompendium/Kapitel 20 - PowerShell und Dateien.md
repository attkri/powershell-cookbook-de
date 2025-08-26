# 20. PowerShell und Dateien

PowerShell bietet zahlreiche Cmdlets zum Arbeiten mit Dateien und Verzeichnissen. Damit lassen sich Dateien lesen, schreiben, durchsuchen und verwalten.

```powershell
Get-Help -Name 'about_Filesystem_Provider' -ShowWindow
```

## 20.1 Dateien lesen und schreiben

Dateien können direkt mit Cmdlets geöffnet und bearbeitet werden. So lassen sich Inhalte schnell einlesen oder speichern.

```powershell
# Datei einlesen
Get-Content C:\\Temp\\info.txt

# Datei schreiben
"Hallo Welt" | Out-File C:\\Temp\\neu.txt

# Text anhängen
"Zusatz" | Add-Content C:\\Temp\\neu.txt
```

## 20.2 Dateien durchsuchen

Mit `Select-String` lassen sich Inhalte effizient durchsuchen, vergleichbar mit `grep`.

```powershell
# Zeilen mit "Error" finden
Select-String -Path C:\\Temp\\*.log -Pattern "Error"

# Ergebnis enthält Datei, Zeilennummer und Text
```

## 20.3 Dateien verschieben und kopieren

Dateien können einfach kopiert, verschoben oder umbenannt werden.

```powershell
# Datei kopieren
Copy-Item C:\\Temp\\neu.txt C:\\Backup\\neu.txt

# Datei verschieben
Move-Item C:\\Temp\\neu.txt C:\\Backup\\neu.txt

# Datei umbenennen
Rename-Item C:\\Backup\\neu.txt -NewName alt.txt
```

## 20.4 Dateiinformationen abrufen

Mit den Cmdlets lassen sich Metadaten wie Größe, Erstellungsdatum oder Attribute abfragen.

```powershell
# Informationen zu Datei anzeigen
Get-Item C:\\Temp\\info.txt | Select-Object Name,Length,CreationTime
```

## 20.5 Dateien löschen

Dateien können direkt aus PowerShell entfernt werden. Vorsicht: Gelöschte Dateien landen nicht im Papierkorb.

```powershell
# Datei löschen
Remove-Item C:\\Temp\\alt.txt

# Mehrere Dateien löschen
Remove-Item C:\\Temp\\*.bak
```

## 20.6 Best Practices

* Immer Pfade überprüfen, bevor Dateien gelöscht oder überschrieben werden.
* `-WhatIf` nutzen, um Änderungen zu simulieren.
* Für große Dateien `-ReadCount` bei `Get-Content` einsetzen.
* Bei Logdateien gezielt `Select-String` statt komplettes Einlesen nutzen.

```powershell
# Sicheres Löschen testen
Remove-Item C:\\Temp\\*.log -WhatIf
```
