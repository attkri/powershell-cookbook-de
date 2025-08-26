# 27. PowerShell Gallery & Paketmanagement

Die PowerShell Gallery ist das zentrale Repository für Module, Skripte und Ressourcen. Mit Paketmanagement-Cmdlets kannst du Module installieren, aktualisieren und verwalten.

```powershell
Get-Help -Name 'PowerShellGet' -ShowWindow
```

## 27.1 Verfügbare Repositories anzeigen

Mit `Get-PSRepository` siehst du, welche Repositories eingebunden sind.

```powershell
# Registrierte Repositories anzeigen
Get-PSRepository

# Neues Repository registrieren
Register-PSRepository -Name MeinRepo -SourceLocation "https://myrepo.com/api/v2"
```

## 27.2 Module suchen

Module können direkt aus der Gallery gesucht werden.

```powershell
# Modul suchen
Find-Module -Name Pester

# Nach Schlagwort suchen
Find-Module -Tag Testing
```

## 27.3 Module installieren und aktualisieren

Mit wenigen Befehlen kannst du Module laden oder auf den neuesten Stand bringen.

```powershell
# Modul installieren
Install-Module -Name Pester -Scope CurrentUser

# Modul aktualisieren
Update-Module -Name Pester

# Modul deinstallieren
Uninstall-Module -Name Pester
```

## 27.4 Module importieren und verwalten

Installierte Module können manuell geladen oder entfernt werden.

```powershell
# Modul importieren
Import-Module Pester

# Geladene Module anzeigen
Get-Module

# Modul entfernen
Remove-Module Pester
```

## 27.5 Skripte aus der Gallery

Auch Skripte können direkt aus der Gallery installiert werden.

```powershell
# Skript suchen
Find-Script -Name Start-Build

# Skript installieren
Install-Script -Name Start-Build -Scope CurrentUser
```

## 27.6 Best Practices

* Module nach Möglichkeit aus vertrauenswürdigen Quellen installieren.
* Repositories klar trennen: **offiziell**, **intern**, **Test**.
* Module regelmäßig aktualisieren, aber vorher testen.
* Abhängigkeiten dokumentieren.

```powershell
# Alle installierten Module und Versionen anzeigen
Get-InstalledModule
```
