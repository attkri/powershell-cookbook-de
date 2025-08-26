# 39. PowerShell und .NET-Integration

PowerShell basiert auf .NET und kann direkt auf Klassen, Methoden und Bibliotheken zugreifen. Damit lassen sich Funktionen nutzen, die über die Standard-Cmdlets hinausgehen.

```powershell
Get-Help -Name 'about_Classes' -ShowWindow
```

## 39.1 .NET-Klassen verwenden

Du kannst .NET-Klassen direkt instanziieren und deren Methoden aufrufen.

```powershell
# String-Objekt erstellen
$str = New-Object System.Text.StringBuilder
$str.Append("Hallo ")
$str.Append("Welt")
$str.ToString()
```

## 39.2 Statische Methoden und Eigenschaften

Statische Mitglieder lassen sich ohne Objekt direkt über den Klassennamen aufrufen.

```powershell
# Zufallszahl
[System.Random]::new().Next(1,100)

# Aktuelles Datum
[System.DateTime]::Now
```

## 39.3 Dateien und Streams

Mit .NET lassen sich auch komplexere Dateioperationen durchführen.

```powershell
# Datei schreiben
[System.IO.File]::WriteAllText("C:\\Temp\\test.txt", "Hallo Welt")

# Datei lesen
[System.IO.File]::ReadAllText("C:\\Temp\\test.txt")
```

## 39.4 Assemblies laden

Externe .NET-Bibliotheken können in PowerShell eingebunden werden.

```powershell
# DLL laden
Add-Type -Path "C:\\Libs\\MeineLib.dll"

# Klasse aus Assembly verwenden
[MeineLib.Tools]::DoSomething()
```

## 39.5 Eigene Klassen in PowerShell

Ab PowerShell 5 können eigene Klassen direkt im Skript definiert werden.

```powershell
class Person {
    [string]$Name
    [int]$Alter

    Person([string]$n, [int]$a) {
        $this.Name = $n
        $this.Alter = $a
    }

    [string] Begruessen() {
        return "Hallo, mein Name ist $($this.Name) und ich bin $($this.Alter) Jahre alt."
    }
}

$p = [Person]::new("Attila", 38)
$p.Begruessen()
```

## 39.6 Best Practices

* .NET nur dort einsetzen, wo Cmdlets nicht ausreichen.
* Auf Kompatibilität achten: Nicht alle .NET-APIs sind auf allen Plattformen verfügbar.
* Für wiederkehrende Logik eigene Klassen und Methoden nutzen.
* Assemblies versionieren und sauber dokumentieren.

```powershell
# Beispiel: GUID generieren
[System.Guid]::NewGuid()
```
