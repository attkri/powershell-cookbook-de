# 41. Best Practices & Standards

Eine saubere Arbeitsweise mit PowerShell erleichtert Wartung, Lesbarkeit und Sicherheit von Skripten. Die folgenden Standards helfen bei der täglichen Praxis.

## 41.1 Namenskonventionen

* Cmdlets im **Verb-Noun**-Format (z. B. `Get-Report`, `Set-Config`).
* Funktions- und Variablennamen klar und sprechend wählen.
* Nur englische Typnamen im Code (z. B. `[string]`, `[int]`).

```powershell
function Get-UserReport {
    param([string]$UserName)
    "Report für $UserName"
}
```

## 41.2 Kommentare & Dokumentation

* Jede Funktion kurz beschreiben.
* Parameter mit `[Parameter()]` und Attributen dokumentieren.
* Bei komplexeren Skripten Header-Kommentare verwenden.

```powershell
<#!
.SYNOPSIS
    Erstellt einen User-Report
.DESCRIPTION
    Diese Funktion erstellt eine einfache Übersicht für einen Benutzer.
#>
function Get-UserReport { ... }
```

## 41.3 Fehlerbehandlung

* Immer terminierende Fehler mit `-ErrorAction Stop` erzwingen.
* `try/catch` nur einsetzen, wenn sinnvoll behandelt werden kann.
* Eigene Fehler mit `throw` oder `Write-Error` erzeugen.

```powershell
try {
    Get-Item "C:\\Temp\\config.json" -ErrorAction Stop
}
catch {
    Write-Error "Konfigurationsdatei fehlt!"
}
```

## 41.4 Sicherheit

* Keine Passwörter im Klartext speichern.
* Für Secrets den **SecretManagement**-Modul oder Credential Manager nutzen.
* Execution Policy sinnvoll setzen (`RemoteSigned` oder `AllSigned`).

```powershell
# Secret sicher ablegen
$cred = Get-Credential
Set-Secret -Name ApiUser -Secret $cred
```

## 41.5 Performance

* Nur benötigte Eigenschaften abfragen (`Select-Object`).
* Bei großen Datenmengen Pipelines nutzen.
* Wo möglich parallele Ausführung (Jobs, ForEach-Object -Parallel).

```powershell
# Nur benötigte Felder abrufen
Get-Process | Select-Object Name, CPU
```

## 41.6 Code-Qualität

* Einheitliche Einrückung (4 Leerzeichen).
* Linter wie **PSScriptAnalyzer** verwenden.
* Skripte mit Git versionieren.

```powershell
# Skriptanalyse starten
Invoke-ScriptAnalyzer -Path .\MeinSkript.ps1
```

## 41.7 Best Practices zusammengefasst

* Klares Cmdlet-Schema (Verb-Noun) nutzen.
* Fehlerbehandlung bewusst einsetzen.
* Security by Default – keine Klartext-Passwörter.
* Performance im Blick behalten.
* Einheitliche Code-Standards und Versionskontrolle einhalten.
