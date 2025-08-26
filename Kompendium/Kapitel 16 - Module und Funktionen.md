# 16. Module und Funktionen

Module und Funktionen helfen dabei, PowerShell-Code zu strukturieren, wiederverwendbar zu machen und in Projekte zu integrieren. Während Funktionen kleine Codeblöcke abbilden, bündeln Module mehrere Funktionen oder Cmdlets in einer Einheit.

```powershell
Get-Help -Name 'about_Modules' -ShowWindow
```

## 16.1 Funktionen erstellen

Funktionen sind benannte Codeblöcke, die wiederholt aufgerufen werden können. Sie erleichtern Wartung und Lesbarkeit.

```powershell
# Einfache Funktion
function Hallo {
    "Hallo Welt"
}

Hallo
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Functions' -ShowWindow
```

## 16.2 Funktionen mit Parametern

Funktionen können Eingaben über Parameter entgegennehmen. So lassen sich flexible und wiederverwendbare Abläufe entwickeln.

```powershell
function Begruessung {
    param($Name)
    "Hallo $Name"
}

Begruessung -Name "Attila"
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Parameters' -ShowWindow
```

## 16.3 Erweiterte Funktionen

Erweiterte Funktionen verhalten sich wie Cmdlets. Mit `CmdletBinding()` und Parametern erhält man zusätzliche Features wie Pipeline-Support und Validierungen.

```powershell
function Get-Quadrat {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [int]$Zahl
    )
    $Zahl * $Zahl
}

Get-Quadrat -Zahl 5
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Functions_Advanced' -ShowWindow
```

## 16.4 Module erstellen

Module sind Sammlungen von Funktionen und Cmdlets in einer Datei oder einem Ordner. Mit ihnen kannst du Code sauber kapseln und weitergeben.

```powershell
# Modul erstellen
New-Item -ItemType Directory -Path .\MeineModule
"function Hallo { 'Hallo aus Modul' }" | Out-File .\MeineModule\Hallo.psm1

# Modul importieren
Import-Module .\MeineModule\Hallo.psm1

# Funktion aus Modul nutzen
Hallo
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Modules' -ShowWindow
```

## 16.5 Module verwalten

PowerShell bietet Cmdlets, um Module zu finden, installieren, laden und zu entfernen. So können Bibliotheken zentral gepflegt werden.

```powershell
# Modul aus PSGallery installieren
Install-Module -Name Pester -Scope CurrentUser

# Modul laden
Import-Module Pester

# Verfügbare Module anzeigen
Get-Module -ListAvailable

# Modul entfernen
Remove-Module Pester
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Module' -ShowWindow
```
