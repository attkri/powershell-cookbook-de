# 30. Automatisierung mit Tasks & Scheduler

PowerShell-Skripte lassen sich über den Windows-Taskplaner oder andere Scheduler automatisch ausführen. Damit kannst du wiederkehrende Aufgaben zuverlässig automatisieren.

```powershell
Get-Help -Name 'ScheduledTasks' -ShowWindow
```

## 30.1 Task Scheduler manuell

Mit der grafischen Oberfläche des Windows-Taskplaners können PowerShell-Skripte zu bestimmten Zeiten oder Ereignissen gestartet werden.

* Trigger: Zeitplan oder Ereignis
* Aktion: PowerShell.exe mit Skriptpfad
* Bedingungen: z. B. nur bei Netzstrom

## 30.2 Aufgaben per PowerShell erstellen

Mit den Cmdlets aus dem Modul **ScheduledTasks** lassen sich geplante Aufgaben direkt aus PowerShell anlegen.

```powershell
# Aktion definieren
$action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "-File C:\\Scripts\\Backup.ps1"

# Trigger: täglich um 20 Uhr
$trigger = New-ScheduledTaskTrigger -Daily -At 20:00

# Aufgabe registrieren
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BackupScript" -Description "Backup per PowerShell"
```

## 30.3 Aufgaben verwalten

Geplante Aufgaben können angezeigt, gestartet oder entfernt werden.

```powershell
# Alle Aufgaben anzeigen
Get-ScheduledTask

# Aufgabe starten
Start-ScheduledTask -TaskName "BackupScript"

# Aufgabe entfernen
Unregister-ScheduledTask -TaskName "BackupScript" -Confirm:$false
```

## 30.4 Aufgaben mit Rechten ausführen

Standardmäßig laufen Tasks im Benutzerkontext. Sie können aber auch mit höheren Rechten oder unter Systemkonto ausgeführt werden.

```powershell
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BackupAdmin" -User "SYSTEM"
```

## 30.5 Best Practices

* Aufgaben klar benennen und dokumentieren.
* Skripte mit Logging und Fehlerbehandlung ausstatten.
* Tasks regelmäßig prüfen und aufräumen.
* Nach Möglichkeit **pwsh.exe** statt **powershell.exe** nutzen (PowerShell 7).

```powershell
# Beispiel: Logging im Taskskript
Start-Transcript -Path C:\\Logs\\backup.log
# ... Backup-Code ...
Stop-Transcript
```
