# 28. Versionskontrolle mit Git

Git ist das Standardwerkzeug für Versionskontrolle. Mit PowerShell kannst du Git direkt nutzen, um Änderungen nachzuvollziehen, Branches zu verwalten und Code zu teilen.

```powershell
Get-Help -Name 'about_Version_Control' -ShowWindow
```

## 28.1 Git installieren

Git muss lokal installiert sein, um es aus PowerShell nutzen zu können.

```powershell
# Version prüfen
git --version
```

## 28.2 Repository erstellen

Ein Git-Repository speichert den Projektverlauf. Es kann lokal oder remote (z. B. GitHub) liegen.

```powershell
# Neues Repository initialisieren
git init

# Repository klonen
git clone https://github.com/benutzer/projekt.git
```

## 28.3 Änderungen nachverfolgen

Dateien werden in Git versioniert. Änderungen lassen sich jederzeit einsehen.

```powershell
# Status anzeigen
git status

# Änderungen vormerken
git add .

# Commit erstellen
git commit -m "Neue Funktion hinzugefügt"
```

## 28.4 Branches und Merges

Mit Branches kannst du Funktionen getrennt entwickeln und später zusammenführen.

```powershell
# Branch erstellen
git branch featureX

# In Branch wechseln
git checkout featureX

# Branch zusammenführen
git checkout main
git merge featureX
```

## 28.5 Remote-Repositories

Um Code zu teilen, werden Repositories auf GitHub, GitLab oder Azure DevOps genutzt.

```powershell
# Remote hinzufügen
git remote add origin https://github.com/benutzer/projekt.git

# Änderungen hochladen
git push origin main

# Änderungen herunterladen
git pull origin main
```

## 28.6 Best Practices

* Häufig committen mit aussagekräftigen Nachrichten.
* Branches für Features und Bugfixes nutzen.
* Pull Requests für Code-Reviews einsetzen.
* `.gitignore` nutzen, um unnötige Dateien auszuschließen.

```powershell
# Beispiel für .gitignore
*.log
*.tmp
Secrets.json
```
