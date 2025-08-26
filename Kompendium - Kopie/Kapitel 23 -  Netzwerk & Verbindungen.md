# 22. Netzwerk & Verbindungen

PowerShell ermöglicht das Überprüfen von Netzwerkverbindungen, das Abfragen von Schnittstellen und das Testen der Erreichbarkeit von Hosts. Damit lassen sich Fehlerdiagnosen und Netzwerkautomatisierungen durchführen.

```powershell
Get-Help -Name 'Test-Connection' -ShowWindow
```

## 22.1 Verbindungen testen

Mit `Test-Connection` und `Test-NetConnection` prüfst du die Erreichbarkeit von Systemen und Ports.

```powershell
# Ping auf Host
Test-Connection google.com -Count 2

# Port prüfen
Test-NetConnection -ComputerName google.com -Port 443
```

## 22.2 IP- und Adapterinformationen

Mit `Get-NetIPAddress` und `Get-NetAdapter` kannst du lokale Netzwerkinformationen abrufen.

```powershell
# IP-Adressen anzeigen
Get-NetIPAddress

# Netzwerkadapter anzeigen
Get-NetAdapter
```

## 22.3 DNS-Abfragen

DNS-Einträge lassen sich direkt mit PowerShell prüfen.

```powershell
# DNS-Eintrag auflösen
Resolve-DnsName google.com
```

## 22.4 Offene Ports und Verbindungen

Mit `Get-NetTCPConnection` lassen sich aktuelle TCP-Verbindungen und offene Ports anzeigen.

```powershell
# Alle offenen Verbindungen anzeigen
Get-NetTCPConnection

# Nach RemotePort filtern
Get-NetTCPConnection -RemotePort 443
```

## 22.5 Dateien aus dem Internet laden

PowerShell kann Dateien direkt von HTTP/HTTPS herunterladen.

```powershell
# Datei herunterladen
Invoke-WebRequest -Uri "https://example.com/Datei.txt" -OutFile C:\\Temp\\Datei.txt

# Nur Inhalt anzeigen
Invoke-WebRequest -Uri "https://example.com" | Select-Object -ExpandProperty Content
```

## 22.6 Best Practices

* Für einfache Pings `Test-Connection`, für Ports und Routing `Test-NetConnection` nutzen.
* Nur benötigte Verbindungen dauerhaft offen lassen.
* Bei automatisierten Downloads immer HTTPS und Zertifikate prüfen.

```powershell
# Verbindung absichern
Invoke-WebRequest -Uri "https://example.com" -SslProtocol Tls12
```
