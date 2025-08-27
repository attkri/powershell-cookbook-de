# 17. PowerShell Remoting

PowerShell Remoting ermöglicht es, Befehle und Skripte auf entfernten Computern auszuführen. Damit lassen sich Systeme zentral verwalten und Aufgaben automatisieren, ohne sich lokal anmelden zu müssen.

```powershell
Get-Help -Name 'about_Remote' -ShowWindow
```

## 17.1 Grundlagen

Remoting basiert auf WS-Man (WinRM) oder SSH. Standardmäßig ist WS-Man auf Windows verfügbar, während SSH plattformübergreifend genutzt werden kann.

```powershell
# WinRM für Remoting aktivieren (nur einmal pro Zielsystem nötig)
Enable-PSRemoting -Force

# Remote-Sitzung erstellen
Enter-PSSession -ComputerName Server01

# Remote-Befehl ausführen
Invoke-Command -ComputerName Server01 -ScriptBlock { Get-Process }
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Remote' -ShowWindow
```

## 17.2 Sitzungen verwalten

Mit Sitzungen (`PSSession`) lassen sich mehrere Remote-Verbindungen parallel verwalten. Das spart Zeit und Ressourcen.

```powershell
# Neue Sitzung erstellen
$session = New-PSSession -ComputerName Server01

# Befehl in Sitzung ausführen
Invoke-Command -Session $session -ScriptBlock { Get-Service }

# Alle Sitzungen anzeigen
Get-PSSession

# Sitzung schließen
Remove-PSSession $session
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_PSSessions' -ShowWindow
```

## 17.3 Remoting über SSH

Ab PowerShell 7 lässt sich Remoting auch über SSH nutzen. Das ist besonders für Linux- oder gemischte Umgebungen hilfreich.

```powershell
# Verbindung über SSH
Enter-PSSession -HostName server01.contoso.com -UserName admin

# Befehl über SSH ausführen
Invoke-Command -HostName server01.contoso.com -UserName admin -ScriptBlock { hostname }
```

👉 Weitere Infos:

```powershell
Get-Help -Name 'about_Remote' -ShowWindow
```

## 17.4 Befehle auf mehreren Systemen

Mit Remoting kannst du Befehle gleichzeitig auf mehreren Rechnern ausführen. So lassen sich Massen-Operationen einfach umsetzen.

```powershell
# Gleichen Befehl auf mehreren Computern ausführen
Invoke-Command -ComputerName Server01,Server02,Server03 -ScriptBlock { Get-ComputerInfo }
```

## 17.5 Sicherheit und Best Practices

- Remoting nur über gesicherte Netzwerke verwenden.
- Authentifizierung per Kerberos (Domäne) oder Zertifikaten bevorzugen.
- Zugriff nur für Administratoren oder spezielle Servicekonten zulassen.
- Nach Nutzung Sitzungen schließen und nicht offen lassen.
- Für plattformübergreifende Szenarien SSH statt WinRM nutzen.

```powershell
# Alle aktiven Remote-Sitzungen prüfen und beenden
Get-PSSession | Remove-PSSession
```
