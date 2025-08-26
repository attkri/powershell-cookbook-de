# 4. Variablen

In PowerShell werden Variablen mit `$` eingeleitet. Sie können Werte unterschiedlichen Typs speichern und sind standardmäßig dynamisch.

## 4.1 Variablen erstellen und verwenden

```powershell
$a = 5
$b = "Hallo"
$c = Get-Date
```

## 4.2 Variablen-Typ festlegen

```powershell
[int]$zahl = 42
[string]$text = "Text"
[datetime]$datum = "2025-01-01"
```

## 4.3 Besondere Variablen

- `$null` → Kein Wert  
- `$_` → aktuelles Pipeline-Objekt  
- `$?` → Status des letzten Befehls (True/False)  
- `$LASTEXITCODE` → Exitcode des letzten nativen Programms  
- `$PID` → Prozess-ID der aktuellen PowerShell-Instanz  
- `$PSVersionTable` → Version und Umgebung  

```powershell
$PSVersionTable.PSVersion
```

## 4.4 Variablenbereich (Scope)

Variablen können in unterschiedlichen **Scopes** existieren: Global, Script, Local.

```powershell
$global:x = "Global"
$script:y = "Script"
$local:z  = "Local"
```

👉 **Best Practice:** Nur Scopes setzen, wenn wirklich nötig – sonst Standard-Variablen nutzen.
