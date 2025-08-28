# 12. Pipeline

Die Pipeline (`|`) verbindet Befehle, sodass die Ausgabe des einen als Eingabe für den nächsten dient.

## 12.1 Grundprinzip

```powershell
Get-Process | Sort-Object CPU -Descending
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Pipelines -ShowWindow
```

## 12.2 Mehrstufige Pipeline

```powershell
Get-Process |
    Where-Object CPU -gt 100 |
    Sort-Object CPU -Descending |
    Select-Object -First 5
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Where -ShowWindow
```

## 12.3 Pipeline und Formatierung

```powershell
Get-Service | Format-Table Name, Status
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Format.ps1xml -ShowWindow
```

## 12.4 Pipeline und Export

```powershell
Get-Process | Export-Csv -Path Prozesse.csv -NoTypeInformation
```

**Weitere Infos:**  

```powershell
Get-Help -Name Export-Csv -ShowWindow
```

**Best Practice:** In Pipelines immer zuerst filtern (`Where-Object`), dann sortieren (`Sort-Object`), und zuletzt formatieren oder exportieren – für bessere Performance und Übersicht.
