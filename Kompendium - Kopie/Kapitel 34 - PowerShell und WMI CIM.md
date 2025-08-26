# 33. PowerShell und WMI/CIM

WMI (Windows Management Instrumentation) und CIM (Common Information Model) ermöglichen den Zugriff auf Systeminformationen und Verwaltungseinstellungen. PowerShell bietet Cmdlets, um diese Schnittstellen direkt zu nutzen.

```powershell
Get-Help -Name 'about_WMI' -ShowWindow
```

## 33.1 WMI vs. CIM

* **WMI**: Ältere Technologie, lokal und per DCOM nutzbar.
* **CIM**: Neuer Standard, basiert auf WS-Man (WinRM), plattformübergreifend.

Empfehlung: Für neue Skripte **CIM** nutzen.

## 33.2 Informationen abfragen

Mit `Get-CimInstance` kannst du Systeminformationen einfach abrufen.

```powershell
# Betriebssystem-Infos
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, LastBootUpTime

# Prozesse anzeigen
Get-CimInstance Win32_Process | Select-Object Name, ProcessId

# Services abfragen
Get-CimInstance Win32_Service | Where-Object { $_.State -eq "Running" }
```

## 33.3 Remotezugriff

CIM arbeitet über WS-Man und ist daher für Remoting optimiert.

```powershell
# Remote-Computer abfragen
Get-CimInstance Win32_ComputerSystem -ComputerName Server01

# Mit CIM-Session
$session = New-CimSession -ComputerName Server01
Get-CimInstance Win32_OperatingSystem -CimSession $session
Remove-CimSession $session
```

## 33.4 Aktionen durchführen

Neben Abfragen lassen sich auch Aktionen über WMI/CIM starten.

```powershell
# Prozess starten
Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{ CommandLine = "notepad.exe" }

# Dienst stoppen
Invoke-CimMethod -ClassName Win32_Service -MethodName StopService -Key @{ Name = "wuauserv" }
```

## 33.5 Unterschiede zu Get-WmiObject

`Get-WmiObject` ist veraltet und sollte nicht mehr verwendet werden. Stattdessen `Get-CimInstance` nutzen.

```powershell
# Altes Cmdlet (vermeiden)
Get-WmiObject Win32_OperatingSystem

# Neues Cmdlet
Get-CimInstance Win32_OperatingSystem
```

## 33.6 Best Practices

* Für Skripte **CIM-Cmdlets** bevorzugen.
* Für wiederholte Abfragen CIM-Sessions verwenden.
* Nur benötigte Eigenschaften abrufen, um Performance zu verbessern.
* Auf Remotesystemen WinRM aktivieren, falls CIM genutzt wird.

```powershell
# Beispiel: Nur bestimmte Eigenschaften abrufen
Get-CimInstance Win32_NetworkAdapterConfiguration | Select-Object Description, MACAddress, IPEnabled
```
