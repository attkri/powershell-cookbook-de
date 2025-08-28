# 18. Jobs und parallele Ausführung

Mit Jobs lassen sich Aufgaben im Hintergrund oder parallel ausführen, ohne die aktuelle PowerShell-Sitzung zu blockieren. So können lange laufende Prozesse nebenbei laufen, während du weiterarbeitest.

```powershell
Get-Help -Name 'about_Jobs' -ShowWindow
```

## 18.1 Hintergrundjobs

Hintergrundjobs starten Befehle asynchron. Das Ergebnis wird gespeichert und kann später abgefragt werden.

```powershell
# Job starten
Start-Job -ScriptBlock { Get-Process }

# Aktive Jobs anzeigen
Get-Job

# Ergebnisse abrufen
Receive-Job -Id 1

# Jobs entfernen
Remove-Job -Id 1
```

**Weitere Infos:**

```powershell
Get-Help -Name 'about_Jobs' -ShowWindow
```

## 18.2 Remoting-Jobs

Jobs können auch auf entfernten Computern laufen. So lassen sich mehrere Systeme parallel steuern.

```powershell
# Job auf Remote-Computer starten
Invoke-Command -ComputerName Server01 -ScriptBlock { Get-Service } -AsJob

# Alle Jobs anzeigen
Get-Job

# Ergebnis abrufen
Receive-Job -Id 2
```

**Weitere Infos:**

```powershell
Get-Help -Name 'about_Remote_Jobs' -ShowWindow
```

## 18.3 ThreadJobs

ThreadJobs sind eine leichtere und schnellere Variante von Jobs, da sie direkt im gleichen Prozess laufen. Sie sind für viele parallele Tasks geeignet.

```powershell
# ThreadJob starten (PS 7+)
Start-ThreadJob -ScriptBlock { Get-Date; Start-Sleep 3; Get-Date }

# Jobs überwachen
Get-Job

# Ergebnis abholen
Receive-Job -Id 3
```

**Weitere Infos:**

```powershell
Get-Help -Name 'about_Thread_Jobs' -ShowWindow
```

## 18.4 ForEach-Object -Parallel

Mit PowerShell 7 lässt sich die Pipeline direkt parallelisieren. So können große Datenmengen effizient verarbeitet werden.

```powershell
1..5 | ForEach-Object -Parallel {
    "Task $_ gestartet"
    Start-Sleep -Seconds 2
    "Task $_ fertig"
}
```

**Weitere Infos:**

```powershell
Get-Help -Name 'ForEach-Object' -ShowWindow
```

## 18.5 Best Practices

- Für kurze, schnelle Tasks → **ThreadJobs** nutzen.
- Für komplexe, unabhängige Tasks → **Hintergrundjobs** verwenden.
- Für Remote-Systeme → **Remoting-Jobs** einsetzen.
- Ressourcen im Blick behalten: viele parallele Jobs können Systemlast stark erhöhen.
- Jobs nach Abschluss aufräumen, um Speicher zu sparen.

```powershell
Get-Job | Remove-Job
```
