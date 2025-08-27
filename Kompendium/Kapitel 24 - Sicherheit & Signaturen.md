# 24. Sicherheit & Signaturen

PowerShell bringt Mechanismen mit, um Skripte vor unbefugter Ausführung zu schützen. Dazu gehören Execution Policy, Signaturen und Rechteverwaltung.

```powershell
Get-Help -Name 'about_Signing' -ShowWindow
```

## 24.1 Execution Policy

Die Execution Policy steuert, welche Skripte ausgeführt werden dürfen. Sie schützt vor unbeabsichtigtem Start unsignierter Skripte.

```powershell
# Aktuelle Execution Policy anzeigen
Get-ExecutionPolicy

# Execution Policy ändern (z. B. RemoteSigned)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 24.2 Skripte signieren

Mit einem Code-Signing-Zertifikat können Skripte digital signiert werden. Dadurch wird sichergestellt, dass sie unverändert sind und vom Autor stammen.

```powershell
# Zertifikat auswählen
$cert = Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert | Select-Object -First 1

# Skript signieren
Set-AuthenticodeSignature -FilePath .\MeinSkript.ps1 -Certificate $cert
```

## 24.3 Signaturen prüfen

Signaturen können jederzeit überprüft werden, um Manipulationen zu erkennen.

```powershell
Get-AuthenticodeSignature -FilePath .\MeinSkript.ps1
```

## 24.4 Rechte und Rollen

Die Rechteverwaltung in Windows spielt auch in PowerShell eine Rolle. Cmdlets können nur mit den entsprechenden Berechtigungen ausgeführt werden.

```powershell
# Skript als Administrator starten
Start-Process PowerShell -Verb RunAs
```

## 24.5 Best Practices

- Execution Policy sinnvoll setzen: z. B. **RemoteSigned** für Benutzer, **AllSigned** in Unternehmen.
- Skripte mit vertrauenswürdigen Zertifikaten signieren.
- Nur notwendige Rechte vergeben, Prinzip der minimalen Berechtigung.
- Signaturen regelmäßig prüfen.

```powershell
# Beispiel: Alle Skripte im Ordner prüfen
Get-ChildItem C:\\Scripts\\*.ps1 | Get-AuthenticodeSignature
```
