# 39. Linux & Cross-Plattform PowerShell

Seit PowerShell 7 ist PowerShell plattformübergreifend verfügbar und läuft auf Windows, Linux und macOS. Dadurch können Skripte für heterogene Umgebungen entwickelt werden.

```powershell
Get-Help -Name 'about_CrossPlatform' -ShowWindow
```

## 39.1 Installation auf Linux

PowerShell kann über Paketmanager wie `apt`, `yum` oder `zypper` installiert werden.

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install -y powershell

# CentOS/RHEL
sudo yum install -y powershell

# Starten
pwsh
```

## 39.2 Unterschiede zu Windows

* Standard-Shell ist Bash, daher andere Tools verfügbar
* Pfade: `/home/user` statt `C:\\Users\\user`
* Dienste über `systemctl` statt `Get-Service`

```powershell
# Beispiel: Prozessabfrage auf Linux
Get-Process --Name sshd

# Dateioperationen sind gleich
Get-ChildItem /var/log
```

## 39.3 Plattformübergreifende Skripte

Skripte sollten so geschrieben werden, dass sie auf allen Plattformen lauffähig sind.

```powershell
# Betriebssystem prüfen
if ($IsWindows) { "Windows" }
elseif ($IsLinux) { "Linux" }
elseif ($IsMacOS) { "macOS" }
```

## 39.4 SSH-Remoting

Auf Linux erfolgt Remoting über SSH statt WinRM. Dies ermöglicht sichere plattformübergreifende Administration.

```powershell
# Verbindung per SSH
Enter-PSSession -HostName server01.linux.local -UserName admin
```

## 39.5 Best Practices

* Plattformunterschiede in Skripten berücksichtigen.
* Nur Cmdlets verwenden, die auf allen Plattformen funktionieren.
* Für spezifische Plattformbefehle Bedingungen einbauen (`$IsWindows`, `$IsLinux`).
* Wo möglich Standards wie SSH, JSON und REST nutzen.

```powershell
# Beispiel: plattformabhängige Logdateien
if ($IsWindows) { Get-Content C:\\Windows\\WindowsUpdate.log }
else { Get-Content /var/log/syslog }
```
