# 19. Fehlerkultur & Best Practices

Eine saubere Fehlerkultur sorgt für robuste Skripte und erleichtert die Wartung. PowerShell bietet viele Mechanismen, um Fehler frühzeitig zu erkennen, gezielt zu behandeln und aussagekräftige Meldungen auszugeben.

## 19.1 Klare Fehlermeldungen

Aussagekräftige Fehlermeldungen helfen beim Debuggen und im Betrieb. Statt kryptischer Meldungen sollten sie Ursache und mögliche Lösung andeuten.

```powershell
Write-Error -Message "Datei konnte nicht geladen werden: Pfad fehlt" -Category ObjectNotFound
```

## 19.2 Fehler frühzeitig prüfen

Vorbedingungen sollten geprüft werden, bevor kritischer Code ausgeführt wird. So lassen sich Fehler vermeiden, bevor sie entstehen.

```powershell
if (-not (Test-Path "C:\\Temp\\config.json")) {
    throw "Konfigurationsdatei fehlt!"
}
```

## 19.3 Exceptions gezielt abfangen

Fehler sollten nur dann behandelt werden, wenn sie sinnvoll gelöst werden können. Unspezifisches Abfangen kann Fehler verschleiern.

```powershell
try {
    Get-Content "C:\\Temp\\Daten.csv"
}
catch [System.IO.FileNotFoundException] {
    "Datei nicht gefunden – bitte prüfen."
}
```

## 19.4 Logging nutzen

Fehler und wichtige Ereignisse sollten protokolliert werden. So können Abläufe später nachvollzogen werden.

```powershell
try {
    # Beispielcode
}
catch {
    Add-Content -Path "C:\\Logs\\script.log" -Value "Fehler: $($_.Exception.Message)"
}
```

## 19.5 Best Practices zusammengefasst

- Fehlermeldungen klar und eindeutig formulieren.
- Vorbedingungen prüfen, bevor Code ausgeführt wird.
- Exceptions gezielt abfangen und nur dort, wo sinnvoll.
- Logging einbauen, um Abläufe nachvollziehbar zu machen.
- Fehler nicht verschweigen – lieber sauber melden und ggf. abbrechen.

**Weitere Infos:**

```powershell
Get-Help -Name 'about_Try_Catch_Finally' -ShowWindow
Get-Help -Name 'about_Throw' -ShowWindow
```
