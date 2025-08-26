# 31. PowerShell und REST-APIs

Mit PowerShell lassen sich REST-APIs direkt ansprechen. Über `Invoke-RestMethod` und `Invoke-WebRequest` können Daten abgerufen, erstellt oder geändert werden.

```powershell
Get-Help -Name 'Invoke-RestMethod' -ShowWindow
```

## 31.1 Daten von APIs abrufen

Mit `Invoke-RestMethod` erhältst du JSON oder XML direkt als Objekte, die weiterverarbeitet werden können.

```powershell
# JSON von API abrufen
Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/PowerShell"

# XML von API abrufen
Invoke-RestMethod -Uri "https://www.w3schools.com/xml/note.xml"
```

## 31.2 API mit Parametern aufrufen

Viele APIs erwarten Parameter, die in der URL oder im Body übergeben werden.

```powershell
# Mit Query-Parametern
Invoke-RestMethod -Uri "https://api.agify.io/?name=attila"
```

## 31.3 Authentifizierung

REST-APIs erfordern oft Token oder Anmeldedaten. Diese können im Header mitgegeben werden.

```powershell
# Mit API-Key im Header
$headers = @{ Authorization = "Bearer <TOKEN>" }
Invoke-RestMethod -Uri "https://api.example.com/data" -Headers $headers
```

## 31.4 Daten an API senden

Mit POST, PUT oder DELETE lassen sich Daten ändern oder neue Einträge erstellen.

```powershell
# POST-Daten senden
$body = @{ Name = "Test"; Wert = 42 } | ConvertTo-Json
Invoke-RestMethod -Uri "https://api.example.com/items" -Method Post -Body $body -ContentType "application/json"
```

## 31.5 Fehlerbehandlung

APIs liefern häufig Statuscodes zurück, die beachtet werden sollten.

```powershell
try {
    Invoke-RestMethod -Uri "https://api.example.com/invalid"
}
catch {
    $_.Exception.Response.StatusCode.Value__
}
```

## 31.6 Best Practices

* Immer HTTPS verwenden, niemals unsichere HTTP-Verbindungen.
* API-Keys und Tokens sicher speichern (z. B. SecretStore, Azure Key Vault).
* Ergebnisse in Objekte umwandeln, um sie direkt weiterzuverarbeiten.
* Rate-Limits und Quotas von APIs beachten.

```powershell
# Ergebnis in Datei sichern
Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/PowerShell/releases" | \
  ConvertTo-Json | Out-File C:\\Temp\\releases.json
```
