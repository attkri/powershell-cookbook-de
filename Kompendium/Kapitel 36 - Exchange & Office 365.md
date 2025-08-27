# 36. Exchange & Office 365 Verwaltung

Mit PowerShell lassen sich sowohl lokale Exchange-Server als auch Exchange Online (Office 365) administrieren. Dazu stehen eigene Module und Cmdlets bereit.

```powershell
Get-Help -Name Exchange -ShowWindow
```

## 36.1 Exchange-Modul laden

Für lokale Exchange-Server wird das Exchange Management Shell-Modul verwendet. Für Exchange Online ist das Modul **ExchangeOnlineManagement** nötig.

```powershell
# Exchange Online Modul installieren
Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser

# Modul importieren
Import-Module ExchangeOnlineManagement
```

## 36.2 Verbindung zu Exchange Online

Zur Verwaltung von Exchange Online wird eine Authentifizierung benötigt.

```powershell
# Verbindung herstellen
Connect-ExchangeOnline -UserPrincipalName admin@contoso.com

# Verbindung trennen
Disconnect-ExchangeOnline
```

## 36.3 Postfächer verwalten

Postfächer lassen sich erstellen, ändern und anzeigen.

```powershell
# Alle Postfächer anzeigen
Get-Mailbox

# Neues Postfach anlegen (lokal)
New-Mailbox -Name "Max Mustermann" -UserPrincipalName mmustermann@contoso.com -Password (Read-Host -AsSecureString "Passwort")

# Eigenschaften ändern
Set-Mailbox -Identity mmustermann -EmailAddresses @{Add="max.mustermann@contoso.com"}
```

## 36.4 Verteiler und Gruppen

Verteilerlisten und Gruppen können per Cmdlet erstellt und verwaltet werden.

```powershell
# Neue Verteilergruppe
New-DistributionGroup -Name "IT-Team" -PrimarySmtpAddress it@contoso.com

# Mitglieder hinzufügen
Add-DistributionGroupMember -Identity "IT-Team" -Member mmustermann

# Mitglieder anzeigen
Get-DistributionGroupMember -Identity "IT-Team"
```

## 36.5 Exchange-Richtlinien

Mit Richtlinien können z. B. Mailbox Limits oder Archivierung konfiguriert werden.

```powershell
# Mailboxgröße prüfen
Get-MailboxStatistics -Identity mmustermann

# Archiv aktivieren
Enable-Mailbox -Identity mmustermann -Archive
```

## 36.6 Best Practices

- In Office 365 immer moderne Authentifizierung verwenden.
- Cmdlets regelmäßig in der Doku prüfen, da sich Online-Module schnell ändern.
- Skripte für Massenänderungen nutzen, statt GUI.
- Nach größeren Änderungen Postfach-Statistiken prüfen.

```powershell
# Beispiel: Alle Postfächer mit Archiv
Get-Mailbox | Where-Object { $_.ArchiveStatus -eq "Active" }
```
