# 14. Fehler und Ausnahmen

PowerShell unterscheidet zwischen **Fehlern (non-terminating)**, die das Skript weiterlaufen lassen, und **Ausnahmen (terminating)**, die den Ablauf sofort beenden. Mit Parametern und Präferenz-Variablen steuerst du, wie damit umgegangen wird.

```powershell
# Kompakte Fehleransicht (PS 7+)
$ErrorView = 'ConciseView'

# Details zum letzten Fehler anzeigen
Get-Error -Newest 1

# Fehler sofort abbrechen lassen
Get-ChildItem C:\NoDir -ErrorAction Stop
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Preference_Variables' -ShowWindow
```

## 14.1 Meldungen unterdrücken

Fehlermeldungen und Ausgaben lassen sich lokal pro Befehl oder global per Variablensteuerung unterdrücken. Das macht Skripte robuster und verhindert unnötige Log-Ausgaben.

```powershell
# Lokale Steuerung
Get-Process -FileVersionInfo `
  -ErrorAction Stop `              # Fehler als Ausnahme
  -WarningAction Ignore `          # Warnungen ausblenden
  -InformationAction Continue `    # Infos anzeigen
  -Verbose                         # ausführliche Meldungen
```

```powershell
# Globale Voreinstellungen sichern, ändern und zurücksetzen
$bak = [ordered]@{
  ErrorAction   = $ErrorActionPreference
  Warning       = $WarningPreference
  Information   = $InformationPreference
  Verbose       = $VerbosePreference
}
$ErrorActionPreference = 'Stop'
$WarningPreference     = 'Stop'
$InformationPreference = 'SilentlyContinue'
$VerbosePreference     = 'SilentlyContinue'
# ... Code ...
$ErrorActionPreference = $bak.ErrorAction
$WarningPreference     = $bak.Warning
$InformationPreference = $bak.Information
$VerbosePreference     = $bak.Verbose
```

```powershell
# Ausgabe ins Leere schicken
Get-Process | Out-Null
Get-Process > $null
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_CommonParameters' -ShowWindow
```

## 14.2 Fehler analysieren

Fehler können über die automatische Variable `$Error`, über `Get-Error` oder über `$?` und `$LASTEXITCODE` nachvollzogen werden. So erkennst du, ob ein Befehl erfolgreich war oder nicht.

```powershell
# Fehlerhistorie
$Error[0] | Format-List *
"Fehleranzahl: $($Error.Count)"
$Error.Clear()
```

```powershell
# Exception-Details auswerten
try { 1/0 } catch {
  $_.Exception.Message
  $_.Exception.GetType().FullName
  $_.Exception.InnerException
}
```

```powershell
# Erfolg prüfen
if ($?) { 'OK' } else { 'Fehler' }

# Exitcode nativer Tools
ping.exe 127.0.0.1 > $null
$LASTEXITCODE
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Automatic_Variables' -ShowWindow
```

## 14.3 Fehler behandeln

Fehler lassen sich mit `try`, `catch` und `finally` abfangen. Dabei sollten spezifische Fehler zuerst behandelt und unspezifische zuletzt gefangen werden.

```powershell
try {
  $bak = $ErrorActionPreference
  $ErrorActionPreference = 'Stop'
  Get-Content 'C:\Temp\wichtig.txt'
}
catch [System.Management.Automation.ItemNotFoundException] {
  New-Item 'C:\Temp\wichtig.txt' -ItemType File | Out-Null
}
catch [System.IO.IOException] {
  # Alternative Behandlung
}
catch {
  Write-Error -Message $_.Exception.Message -ErrorId 'Unhandled' -Category NotSpecified
  throw
}
finally {
  $ErrorActionPreference = $bak
}
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Try_Catch_Finally' -ShowWindow
```

## 14.4 Eigene Fehler auslösen

Eigene Fehler sind nützlich, wenn Eingaben nicht den Erwartungen entsprechen oder Vorbedingungen verletzt sind. So stellst du sicher, dass Fehler früh sichtbar werden.

```powershell
# Einfache Ausnahme
throw "Ungültige Eingabe."

# Typisierte Ausnahme
throw [System.ArgumentException]::new("Wert ist ungültig", "Path")

# Nicht-terminierender Fehler
Write-Error -Message "Benutzer nicht gefunden" -Category ObjectNotFound -ErrorId 'User404' -TargetObject 'max.mustermann'
```

```powershell
# Validate-Attribute prüfen Eingaben automatisch
param(
  [ValidateRange(1,10)] [int]$Level,
  [ValidatePattern('^[A-Z]{2,5}[0-9]+$')] [string]$HostName
)
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Throw' -ShowWindow
```
