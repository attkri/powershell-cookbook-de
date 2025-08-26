# 25. PowerShell Profile & Anpassung

Mit Profilskripten lässt sich die PowerShell-Umgebung individuell anpassen. So kannst du eigene Funktionen, Aliase oder Module automatisch laden.

```powershell
Get-Help -Name 'about_Profiles' -ShowWindow
```

## 25.1 Profilpfade

Jeder Benutzer und jede Host-Anwendung hat ein eigenes Profil. Über die Variable `$PROFILE` erreichst du den aktuellen Pfad.

```powershell
# Pfad zum aktuellen Profil anzeigen
$PROFILE

# Alle Profilpfade anzeigen
$PROFILE | Format-List * -Force
```

## 25.2 Neues Profil erstellen

Falls noch kein Profil existiert, kannst du eine neue Datei anlegen.

```powershell
# Neues Profil erstellen
if (-not (Test-Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}
```

## 25.3 Profil bearbeiten

Das Profil ist eine normale PowerShell-Datei und kann mit einem Editor angepasst werden.

```powershell
# Profil mit VSCode öffnen
code $PROFILE

# Profil mit Notepad öffnen
notepad $PROFILE
```

## 25.4 Anpassungen im Profil

Typische Anpassungen sind Aliase, Funktionen oder automatische Modulimporte.

```powershell
# Alias hinzufügen
Set-Alias ll Get-ChildItem

# Funktion definieren
function Hallo { "Hallo $env:USERNAME" }

# Modul automatisch laden
Import-Module PSReadLine
```

## 25.5 Best Practices

* Profile klar strukturieren und dokumentieren.
* Keine komplexen Skripte direkt im Profil – besser Funktionen oder Module nutzen.
* Änderungen zuerst testen, bevor sie ins Profil übernommen werden.
* Profil regelmäßig sichern und versionskontrolliert ablegen.

```powershell
# Profil sichern
Copy-Item $PROFILE "$env:USERPROFILE\\profile_backup.ps1"
```
