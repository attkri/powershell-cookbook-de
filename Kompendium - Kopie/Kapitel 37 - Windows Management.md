# 36. Windows Management (Updates, Eventlogs, Tasks)

PowerShell eignet sich, um Windows-Systeme umfassend zu verwalten: Updates installieren, Ereignisprotokolle auswerten und geplante Aufgaben steuern.

```powershell
Get-Help -Name 'about_Eventlogs' -ShowWindow
```

## 36.1 Windows Updates

Mit Modulen wie **PSWindowsUpdate** lassen sich Updates per PowerShell installieren und verwalten.

```powershell
# Modul installieren
Install-Module -Name PSWindowsUpdate -Scope CurrentUser

# Verfügbare Updates anzeigen
Get-WindowsUpdate

# Updates installieren
Install-WindowsUpdate -AcceptAll -AutoReboot
```

## 36.2 Ereignisprotokolle

Ereignisprotokolle helfen bei Fehleranalyse und Monitoring. PowerShell bietet verschiedene Cmdlets zum Auslesen.

```powershell
# Alle Logs anzeigen
Get-EventLog -List

# Einträge aus dem System-Log
Get-EventLog -LogName System -Newest 20

# Neue API (empfohlen)
Get-WinEvent -LogName Application -MaxEvents 10

# Nach Fehlern filtern
Get-WinEvent -FilterHashtable @{LogName='System'; Level=2} | Format-Table TimeCreated, Message
```

## 36.3 Geplante Aufgaben

Windows Scheduled Tasks können direkt mit PowerShell verwaltet werden.

```powershell
# Aufgaben anzeigen
Get-ScheduledTask

# Aufgabe starten
Start-ScheduledTask -TaskName "BackupScript"

# Aufgabe anlegen
$action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "-File C:\\Scripts\\Backup.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 20:00
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BackupScript"
```

## 36.4 Dienste und Systemstatus

Systemdienste und Statuswerte können zentral überwacht werden.

```powershell
# Alle Dienste anzeigen
Get-Service

# Bestimmten Dienst neu starten
Restart-Service -Name wuauserv

# Computerinformationen
Get-ComputerInfo | Select-Object OSName, OsArchitecture, WindowsVersion
```

## 36.5 Best Practices

* Für Updates nur signierte Quellen nutzen.
* Ereignisprotokolle gezielt filtern, statt alles zu exportieren.
* Geplante Aufgaben dokumentieren und mit klaren Namen versehen.
* Services nicht blind stoppen – Abhängigkeiten prüfen.

```powershell
# Beispiel: Nur Fehlereinträge der letzten 24h
Get-WinEvent -FilterHashtable @{LogName='Application'; Level=2; StartTime=(Get-Date).AddDays(-1)}
```
