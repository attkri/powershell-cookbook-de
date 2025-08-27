# 22. Prozesse und Dienste

PowerShell bietet Cmdlets, um Prozesse und Dienste zu überwachen und zu steuern. Damit lassen sich Anwendungen starten, beenden oder Services konfigurieren.

```powershell
Get-Help -Name 'about_Processes' -ShowWindow
```

## 22.1 Prozesse anzeigen

Prozesse können mit `Get-Process` aufgelistet werden. So erhältst du Informationen wie CPU-Auslastung, Speicher oder Prozess-ID.

```powershell
# Alle Prozesse anzeigen
Get-Process

# Spezifischen Prozess anzeigen
Get-Process -Name notepad

# Prozesse sortieren nach CPU
Get-Process | Sort-Object CPU -Descending
```

## 22.2 Prozesse steuern

Prozesse lassen sich direkt starten oder beenden.

```powershell
# Prozess starten
Start-Process notepad.exe

# Prozess mit Parametern starten
Start-Process notepad.exe -ArgumentList "C:\\Temp\\info.txt"

# Prozess beenden
Stop-Process -Name notepad -Force
```

## 22.3 Dienste anzeigen

Dienste können mit `Get-Service` überwacht werden. Du kannst Status, Starttyp und Namen abfragen.

```powershell
# Alle Dienste anzeigen
Get-Service

# Dienst nach Namen suchen
Get-Service -Name wuauserv

# Nach Status filtern
Get-Service | Where-Object Status -eq Running
```

## 22.4 Dienste steuern

Dienste können gestartet, gestoppt oder neu gestartet werden.

```powershell
# Dienst starten
Start-Service -Name wuauserv

# Dienst stoppen
Stop-Service -Name wuauserv

# Dienst neu starten
Restart-Service -Name wuauserv
```

## 22.5 Dienste konfigurieren

Über WMI oder CIM lassen sich Starttyp und andere Eigenschaften von Diensten ändern.

```powershell
# Starttyp ändern (z. B. auf Automatisch)
Set-Service -Name wuauserv -StartupType Automatic
```

## 22.6 Best Practices

- Prozesse und Dienste nie blind beenden – mögliche Abhängigkeiten prüfen.
- Administrative Rechte beachten: manche Dienste erfordern erhöhte Privilegien.
- Für wiederkehrende Verwaltung Skripte nutzen, statt manuell zu arbeiten.

```powershell
# Beispiel: Alle gestoppten Dienste starten
Get-Service | Where-Object Status -eq Stopped | Start-Service
```
