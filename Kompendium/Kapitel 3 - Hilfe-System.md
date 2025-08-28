# 3. Hilfe-System

PowerShell hat ein integriertes Hilfesystem.  
Es liefert Dokumentation zu Cmdlets, Parametern und Konzepten (`about_*`).  
Die Hilfe kann aktualisiert und auch offline gespeichert werden.  

## 3.1 Hilfe aufrufen

```powershell
# Hilfe zu Cmdlets anzeigen
Get-Help Get-Command

# Varianten
Get-Help Get-Command -Detailed       # Details
Get-Help Get-Command -Examples       # Beispiele
Get-Help Get-Command -Full           # Volltext
Get-Help Get-Command -Online         # Doku im Browser
Get-Help Get-Command -Parameter Name # Nur Parameterinfo
```

## 3.2 Hilfe aktualisieren

```powershell
# Hilfe aktualisieren
Update-Help -Force

# Hilfe zentral speichern & verteilen
Save-Help -DestinationPath C:\temp\Help
Update-Help -SourcePath C:\temp\Help
```

## 3.3 Hilfe durchsuchen

```powershell
# Hilfe nach Cmdlets durchsuchen
Get-Help *service*

# Hilfe-Themen anzeigen
Get-Help about_*
```

## 3.4 Hilfe mit Get-Command nutzen

```powershell
# Cmdlets nach Verb durchsuchen
Get-Command -Verb Get

# Cmdlets nach Noun durchsuchen
Get-Command -Noun Service

# Nach Modul suchen
Get-Command -Module NetTCPIP

# Parameter suchen
Get-Command -ParameterName ComputerName
```

`gcm` ist der Alias für `Get-Command`.

## 3.5 About-Themen

PowerShell enthält zusätzliche **Hilfethemen** zu Sprache, Syntax und Konzepten (`about_*`).

```powershell
# Alle About-Themen anzeigen
Get-Help about_*


# Beispiel: Hilfe zu Arrays
Get-Help about_Arrays
```

## 3.6 Externe Hilfequellen

Neben der integrierten Hilfe sind auch **externe Quellen** nützlich:

- [Microsoft Docs](https://learn.microsoft.com/powershell/)
- [PowerShell Gallery](https://www.powershellgallery.com)
- Community (z. B. Blogs, GitHub, Foren)
