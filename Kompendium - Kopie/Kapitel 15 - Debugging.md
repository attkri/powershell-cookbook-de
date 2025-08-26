# 14. Debugging

Debugging ermöglicht es, PowerShell-Code gezielt zu unterbrechen und Schritt für Schritt zu prüfen. Damit lassen sich Fehlerquellen schneller finden und Abläufe besser nachvollziehen. Typische Werkzeuge sind Breakpoints, der integrierte Debugger und die Debugging-Funktionen in VSCode.

```powershell
Get-Help -Name 'about_Debuggers' -ShowWindow
```

## 14.1 Breakpoints setzen

Breakpoints stoppen den Code an einer bestimmten Stelle. So kannst du Variablen einsehen, Ausgaben überprüfen und den Ablauf kontrollieren.

```powershell
# Breakpoint in Datei bei bestimmter Zeile
Set-PSBreakpoint -Script .\Skript.ps1 -Line 10

# Breakpoint auf Variable
Set-PSBreakpoint -Variable counter -Mode Write

# Breakpoint auf Funktion
Set-PSBreakpoint -Command Get-Process

# Breakpoints anzeigen und löschen
Get-PSBreakpoint
Remove-PSBreakpoint -Id 1
```

## 14.2 Debugger verwenden

Der integrierte Debugger führt Code schrittweise aus und zeigt, wie Variablen und Ausgaben entstehen. So kannst du komplexe Logik nachvollziehen und Fehler lokalisieren.

```powershell
# Skript mit Debugger starten
powershell.exe -Command "Set-PSDebug -Step"

# Eingaben im Debugger
s  # step into
o  # step out
v  # step over
c  # continue
q  # quit
```

```powershell
# Debug-Optionen prüfen und steuern
Get-PSDebug
Set-PSDebug -Trace 1   # Tracing aktivieren
Set-PSDebug -Trace 0   # Tracing deaktivieren
```

## 14.3 Debugging in VSCode

Mit der PowerShell-Extension in Visual Studio Code kannst du komfortabel debuggen. Breakpoints setzt du per Klick, und Variablen sowie Call-Stack sind im Debug-Panel sichtbar.

```json
// launch.json Beispiel für Debug-Config
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "PowerShell",
      "request": "launch",
      "name": "PowerShell Debug",
      "script": "${file}"
    }
  ]
}
```

## 14.4 Remote-Debugging

Manche Fehler treten nur in der Zielumgebung auf. Mit Remote-Debugging kannst du Prozesse auf anderen Maschinen untersuchen und Skripte direkt dort nachverfolgen.

```powershell
# Remote-Session starten und Runspace debuggen
$session = New-PSSession -ComputerName Server01
Enter-PSHostProcess -Id (Get-Process -Name pwsh).Id -AppDomainName DefaultAppDomain
Debug-Runspace -Id 1
```

## 14.5 Tipps & Best Practices

Effizientes Debugging spart Zeit und reduziert Fehlersuchen:

* Breakpoints gezielt setzen, nicht flächendeckend.
* Tracing nur bei Bedarf nutzen, da es Leistung kostet.
* In VSCode Call-Stack und Variablenüberwachung aktiv einsetzen.
* Remote-Debugging nur über sichere Sessions durchführen.
* Zum Schluss alle Breakpoints entfernen, um saubere Skripte zu gewährleisten.

```powershell
Get-PSBreakpoint | Remove-PSBreakpoint
```
