# 28. Skripte testen mit Pester

Pester ist das Standard-Framework für Tests in PowerShell. Es ermöglicht Unit-Tests, Integrationstests und das Validieren von Skripten und Modulen.

```powershell
Get-Help -Name 'Pester' -ShowWindow
```

## 28.1 Pester installieren

Pester ist als Modul verfügbar und kann über die PowerShell Gallery installiert werden.

```powershell
# Modul installieren
Install-Module -Name Pester -Scope CurrentUser

# Modul laden
Import-Module Pester
```

## 28.2 Erstes Testskript

Ein Testskript besteht aus `Describe`-Blöcken (Testsuite) und `It`-Blöcken (Einzeltests).

```powershell
# Datei: Tests.ps1
Describe "Mathematik" {
    It "Addiert Zahlen korrekt" {
        (2 + 3) | Should -Be 5
    }
}
```

```powershell
# Tests ausführen
Invoke-Pester .\Tests.ps1
```

## 28.3 Funktionen testen

Eigene Funktionen können gezielt getestet werden.

```powershell
# Funktion
function Addiere($a, $b) { $a + $b }

# Test
Describe "Addiere" {
    It "Addiert korrekt" {
        (Addiere 2 3) | Should -Be 5
    }
}
```

## 28.4 Mocks verwenden

Mit Mocks kannst du Abhängigkeiten ersetzen und Verhalten simulieren.

```powershell
Describe "Dateiprüfung" {
    Mock Test-Path { $true }
    It "Datei sollte existieren" {
        (Test-Path "C:\\temp\\demo.txt") | Should -Be $true
    }
}
```

## 28.5 Testberichte erstellen

Pester kann detaillierte Reports erzeugen, die für CI/CD-Pipelines genutzt werden.

```powershell
Invoke-Pester -OutputFormat NUnitXml -OutputFile TestResult.xml
```

## 28.6 Best Practices

* Tests immer zusammen mit Code entwickeln (Test-Driven Development bevorzugt).
* Kleine, fokussierte Tests schreiben.
* Tests automatisiert in Build-Pipelines einbinden.
* Auch Fehlerszenarien testen.

```powershell
# Beispiel für Fehlertest
{ 1/0 } | Should -Throw
```
