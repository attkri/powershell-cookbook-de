# 38. JEA (Just Enough Administration)

**Just Enough Administration (JEA)** ist ein Sicherheitskonzept in PowerShell, das es ermöglicht, minimale Rechte für Verwaltungsaufgaben zu vergeben. Nutzer erhalten nur die Befehle, die sie für ihre Arbeit benötigen.

```powershell
Get-Help -Name 'about_JEA' -ShowWindow
```

## 38.1 Grundlagen

Mit JEA kannst du sogenannte Endpoints definieren, über die Benutzer eingeschränkte PowerShell-Sitzungen starten. Diese Sitzungen enthalten nur die erlaubten Cmdlets, Funktionen oder Skripte.

- Prinzip: **Least Privilege** – nur die notwendigen Rechte
- Vorteile: Weniger Angriffsfläche, kontrollierte Administration

## 38.2 Role Capabilities

Role Capabilities definieren, welche Cmdlets oder Funktionen ein Benutzer in einer JEA-Session ausführen darf.

```powershell
# Beispiel: Role Capability Datei erstellen
New-Item -Path "C:\\Program Files\\WindowsPowerShell\\Modules\\MyJEA\\RoleCapabilities" -ItemType Directory -Force

$rcFile = "C:\\Program Files\\WindowsPowerShell\\Modules\\MyJEA\\RoleCapabilities\\HelpDesk.psrc"

New-PSRoleCapabilityFile -Path $rcFile -VisibleCmdlets Get-Service, Restart-Service
```

## 38.3 Session Configuration

Eine Session Configuration bindet die Role Capabilities an eine PowerShell-Endpunktdefinition.

```powershell
# Session Configuration Datei erstellen
$sessionFile = "C:\\Program Files\\WindowsPowerShell\\Modules\\MyJEA\\MyJEA.pssc"

New-PSSessionConfigurationFile -Path $sessionFile -SessionType RestrictedRemoteServer -RoleDefinitions @{ "CONTOSO\\HelpDesk" = @{ RoleCapabilities = 'HelpDesk' } }

# Registrierung der Session
Register-PSSessionConfiguration -Name "JEA-HelpDesk" -Path $sessionFile -Force
```

## 38.4 Nutzung von JEA-Sessions

Benutzer können sich nun mit dem JEA-Endpunkt verbinden und haben nur die erlaubten Befehle zur Verfügung.

```powershell
# Verbindung mit JEA-Endpoint
Enter-PSSession -ComputerName Server01 -ConfigurationName JEA-HelpDesk
```

## 38.5 Best Practices

- JEA für Rollen wie Helpdesk, Support oder Operator nutzen.
- Nur die nötigsten Cmdlets und Funktionen freigeben.
- Session Configurations versionieren und dokumentieren.
- JEA-Endpunkte regelmäßig überprüfen und anpassen.

```powershell
# Verfügbare JEA-Endpoints anzeigen
Get-PSSessionConfiguration
```
