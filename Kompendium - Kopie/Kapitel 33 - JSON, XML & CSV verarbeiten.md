# 32. JSON, XML & CSV verarbeiten

PowerShell unterstützt den Umgang mit strukturierten Datenformaten wie JSON, XML und CSV nativ. So lassen sich Konfigurationsdateien, API-Daten oder Reports einfach einlesen und weiterverarbeiten.

```powershell
Get-Help -Name 'ConvertFrom-Json' -ShowWindow
```

## 32.1 JSON verarbeiten

JSON wird direkt in PowerShell-Objekte umgewandelt und kann einfach genutzt werden.

```powershell
# JSON einlesen
$json = '{"Name":"Attila","Alter":38}' | ConvertFrom-Json
$json.Name

# Objekt in JSON konvertieren
$obj = @{ Projekt = "Demo"; Status = "Aktiv" }
$obj | ConvertTo-Json -Depth 3
```

## 32.2 XML verarbeiten

XML wird als XML-Objekt eingelesen und lässt sich mit Pfaden und Eigenschaften durchsuchen.

```powershell
# XML einlesen
[xml]$xml = Get-Content C:\\Temp\\Daten.xml
$xml.Dokument.Element

# Neues XML erzeugen
$xml = New-Object System.Xml.XmlDocument
$root = $xml.CreateElement("Root")
$xml.AppendChild($root)
$xml.Save("C:\\Temp\\neu.xml")
```

## 32.3 CSV verarbeiten

CSV-Dateien werden automatisch in Tabellenobjekte umgewandelt. Ideal für Reports oder Datenexporte.

```powershell
# CSV einlesen
$data = Import-Csv C:\\Temp\\Personen.csv
$data | Where-Object { $_.Alter -gt 30 }

# CSV exportieren
$data | Export-Csv C:\\Temp\\export.csv -NoTypeInformation -Encoding UTF8
```

## 32.4 Konvertierungen

PowerShell kann zwischen den Formaten wechseln, um Daten flexibel zu nutzen.

```powershell
# JSON nach CSV konvertieren
Invoke-RestMethod -Uri "https://api.agify.io/?name=attila" | \
  ConvertTo-Csv -NoTypeInformation

# CSV nach JSON konvertieren
Import-Csv C:\\Temp\\Personen.csv | ConvertTo-Json -Depth 3
```

## 32.5 Best Practices

* Für APIs JSON bevorzugen, für Tabellenberichte CSV.
* Bei JSON `-Depth` beachten, da verschachtelte Strukturen sonst abgeschnitten werden.
* CSV-Export immer mit `-NoTypeInformation` nutzen.
* XML nur verwenden, wenn zwingend notwendig (z. B. für Legacy-Systeme).

```powershell
# Beispiel: JSON-Ergebnis sichern
Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/PowerShell" | \
  ConvertTo-Json -Depth 5 | Out-File C:\\Temp\\repo.json
```
