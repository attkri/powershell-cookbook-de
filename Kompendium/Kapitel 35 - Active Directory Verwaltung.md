# 35. Active Directory Verwaltung

Mit PowerShell und dem Modul **ActiveDirectory** lassen sich Benutzer, Gruppen, Computer und OU-Strukturen zentral verwalten. Das Modul ist Teil der RSAT-Tools oder auf Domain Controllern bereits installiert.

```powershell
Get-Help -Name ActiveDirectory -ShowWindow
```

## 35.1 Modul laden

Bevor du Active Directory-Cmdlets nutzen kannst, muss das Modul geladen werden.

```powershell
# Modul importieren
Import-Module ActiveDirectory

# Verfügbare Cmdlets anzeigen
Get-Command -Module ActiveDirectory
```

## 35.2 Benutzer verwalten

Benutzer können erstellt, geändert oder gelöscht werden.

```powershell
# Neuen Benutzer anlegen
New-ADUser -Name "Max Mustermann" -SamAccountName mmustermann -AccountPassword (Read-Host -AsSecureString "Passwort") -Enabled $true

# Benutzer ändern
Set-ADUser -Identity mmustermann -Department "IT"

# Benutzer anzeigen
Get-ADUser -Identity mmustermann -Properties *

# Benutzer löschen
Remove-ADUser -Identity mmustermann -Confirm:$false
```

## 35.3 Gruppen verwalten

Gruppen steuern Berechtigungen und lassen sich per Cmdlets anpassen.

```powershell
# Neue Gruppe erstellen
New-ADGroup -Name "IT-Admins" -GroupScope Global -Path "OU=Gruppen,DC=contoso,DC=com"

# Benutzer zur Gruppe hinzufügen
Add-ADGroupMember -Identity "IT-Admins" -Members mmustermann

# Gruppenmitglieder anzeigen
Get-ADGroupMember -Identity "IT-Admins"

# Benutzer aus Gruppe entfernen
Remove-ADGroupMember -Identity "IT-Admins" -Members mmustermann -Confirm:$false
```

## 35.4 Computer und OUs

Auch Computerobjekte und Organisationseinheiten lassen sich verwalten.

```powershell
# Computerobjekt anzeigen
Get-ADComputer -Identity PC01 -Properties *

# Computer verschieben
Move-ADObject -Identity "CN=PC01,OU=Workstations,DC=contoso,DC=com" -TargetPath "OU=IT,DC=contoso,DC=com"

# Neue OU erstellen
New-ADOrganizationalUnit -Name "Skripte" -Path "DC=contoso,DC=com"
```

## 35.5 Suchen und filtern

AD-Objekte lassen sich flexibel filtern und suchen.

```powershell
# Alle Benutzer in der OU "IT"
Get-ADUser -Filter * -SearchBase "OU=IT,DC=contoso,DC=com"

# Benutzer mit abgelaufenem Passwort
Search-ADAccount -PasswordExpired

# Gesperrte Konten anzeigen
Search-ADAccount -LockedOut
```

## 35.6 Best Practices

* Änderungen zuerst in Testumgebungen durchführen.
* Immer mit `-WhatIf` prüfen, bevor produktive Objekte geändert werden.
* OU-Struktur sauber halten und Namenskonventionen einhalten.
* Gruppenverschachtelungen vermeiden, um Berechtigungen übersichtlich zu halten.

```powershell
# Sicher testen
Remove-ADUser -Identity testuser -WhatIf
```
