# 11. Skripte

Skripte sind PowerShell-Dateien mit der Endung `.ps1`, die mehrere Befehle enthalten und automatisierte Abläufe ermöglichen.

## 11.1 Skript erstellen

Ein Skript wird als Textdatei mit der Endung `.ps1` gespeichert.

```powershell
# Datei: Hallo.ps1
Write-Output "Hallo Welt"
```

Ausführen:

```powershell
./Hallo.ps1
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Scripts -ShowWindow
```

## 11.2 Ausführungsrichtlinien

Die **Execution Policy** steuert, ob Skripte ausgeführt werden dürfen.

```powershell
Get-ExecutionPolicy
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Execution_Policies -ShowWindow
```

## 11.3 Parameter in Skripten

Skripte können Eingaben über **Param-Block** erhalten.

```powershell
param(
    [string]$Name
)

Write-Output "Hallo $Name"
```

Aufruf:

```powershell
./Hallo.ps1 -Name Attila
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Parameters -ShowWindow
```

## 11.4 Rückgabewerte

Skripte geben standardmäßig alle Ausgaben zurück.

```powershell
# Datei: Quadrat.ps1
param([int]$Zahl)

$Zahl * $Zahl
```

Aufruf:

```powershell
./Quadrat.ps1 -Zahl 5   # 25
```

**Best Practice:** Skripte immer mit Parametern schreiben und keine festen Werte im Code verwenden – macht sie wiederverwendbar.
