# Kapitel 9 – Module

Module bündeln Funktionen, Cmdlets und Ressourcen und machen sie wiederverwendbar.

## 9.1 Module laden

Ein Modul kann mit **Import-Module** geladen werden.

```powershell
Import-Module Microsoft.PowerShell.Management
```

👉 Weitere Infos:  
```powershell
Get-Help -Name Import-Module -ShowWindow
```

## 9.2 Installieren von Modulen

Neue Module können aus der PowerShell Gallery installiert werden.

```powershell
Install-Module -Name Pester -Scope CurrentUser
```

👉 Weitere Infos:  
```powershell
Get-Help -Name Install-Module -ShowWindow
```

## 9.3 Auflisten installierter Module

```powershell
Get-Module -ListAvailable
```

👉 Weitere Infos:  
```powershell
Get-Help -Name Get-Module -ShowWindow
```

## 9.4 Export von Modulen

Eigene Module können in `.psm1`-Dateien gespeichert werden.

```powershell
function Hallo {
    "Hallo Welt"
}

Export-ModuleMember -Function Hallo
```

👉 Weitere Infos:  
```powershell
Get-Help -Name Export-ModuleMember -ShowWindow
```

👉 **Best Practice:** Eigene Funktionen in Modulen organisieren – erleichtert Wiederverwendung und Verteilung.
