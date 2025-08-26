# 12. Objekte

In PowerShell ist fast alles ein Objekt. Objekte haben **Eigenschaften** (Daten) und **Methoden** (Funktionen).

## 12.1 Eigenschaften abfragen

```powershell
Get-Process | Select-Object -Property Name, Id
```

👉 Weitere Infos:  

```powershell
Get-Help -Name Select-Object -ShowWindow
```

## 12.2 Methoden verwenden

```powershell
"hallo".ToUpper()
```

👉 Weitere Infos:  

```powershell
Get-Help -Name about_Methods -ShowWindow
```

## 12.3 Objekte filtern

```powershell
Get-Service | Where-Object Status -eq "Running"
```

👉 Weitere Infos:  

```powershell
Get-Help -Name Where-Object -ShowWindow
```

## 12.4 Objekte sortieren

```powershell
Get-Process | Sort-Object CPU -Descending
```

👉 Weitere Infos:  

```powershell
Get-Help -Name Sort-Object -ShowWindow
```

## 12.5 Objekte formatieren

```powershell
Get-Service | Format-Table Name, Status
```

👉 Weitere Infos:  

```powershell
Get-Help -Name about_Format.ps1xml -ShowWindow
```

👉 **Best Practice:** Erst filtern und sortieren, dann formatieren – so bleibt die Verarbeitung performant und übersichtlich.
