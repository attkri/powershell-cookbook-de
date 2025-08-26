# 31. PowerShell in CI/CD-Pipelines

PowerShell eignet sich hervorragend für Continuous Integration (CI) und Continuous Deployment (CD). Skripte können Build-, Test- und Deployment-Prozesse automatisieren.

```powershell
Get-Help -Name 'PowerShell' -ShowWindow
```

## 31.1 Einsatz in Build-Systemen

Viele Build-Server wie Azure DevOps, GitHub Actions oder Jenkins unterstützen PowerShell-Skripte nativ.

```yaml
# Beispiel: GitHub Actions Workflow
name: CI
on: [push]
jobs:
  build:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v2
      - name: PowerShell Script
        run: pwsh ./build.ps1
```

## 31.2 Tests einbinden

Mit Pester lassen sich Unit-Tests automatisch ausführen und Ergebnisse in Reports speichern.

```powershell
# Tests ausführen und Report erzeugen
Invoke-Pester -OutputFormat NUnitXml -OutputFile TestResult.xml
```

## 31.3 Artefakte erstellen

Skripte können Build-Artefakte erzeugen, wie ZIP-Dateien oder Installationspakete.

```powershell
# Ordner packen
Compress-Archive -Path ./App -DestinationPath ./build/App.zip
```

## 31.4 Deployment automatisieren

Deployment-Skripte können Dateien kopieren, Dienste neu starten oder Konfigurationen ändern.

```powershell
# Dateien auf Server kopieren
Copy-Item -Path ./build/App.zip -Destination \\Server01\Deploy$

# Dienst neu starten
Restart-Service -Name IIS
```

## 31.5 Best Practices

* Skripte modular aufbauen, damit sie in verschiedenen Pipelines nutzbar sind.
* Tests automatisiert in die Pipeline integrieren.
* Fehlerbehandlung einbauen, damit Pipelines bei Problemen korrekt stoppen.
* Konfigurationen und Secrets niemals fest im Skript speichern, sondern über Umgebungsvariablen oder Secret Stores.

```powershell
# Beispiel für Zugriff auf Secret in Pipeline
$apiKey = $env:API_KEY
```
