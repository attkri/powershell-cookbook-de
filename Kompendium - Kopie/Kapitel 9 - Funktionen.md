# 8. Funktionen

Funktionen ermöglichen es, wiederverwendbare Codeblöcke zu definieren und übersichtlicher zu arbeiten.

## 8.1 Einfache Funktionen

Eine Funktion wird mit dem Schlüsselwort **function** definiert.

```powershell
function Hallo {
    "Hallo Welt"
}

Hallo
```

👉 Weitere Infos:  

```powershell
Get-Help -Name about_Functions -ShowWindow
```

## 8.2 Funktionen mit Parametern

Funktionen können Eingaben über **Parameter** erhalten.

```powershell
function Begruessung {
    param($Name)
    "Hallo $Name"
}

Begruessung -Name "Attila"
```

👉 Weitere Infos:

```powershell
Get-Help -Name about_Parameters -ShowWindow
```

## 8.3 Rückgabewerte

Funktionen geben standardmäßig alles zurück, was sie ausgeben.

```powershell
function Quadrat {
    param($Zahl)
    return $Zahl * $Zahl
}

Quadrat -Zahl 4   # 16
```

👉 Weitere Infos:

```powershell
Get-Help -Name about_Return -ShowWindow
```

## 8.4 Erweiterte Funktionen

Erweiterte Funktionen verhalten sich wie Cmdlets und bieten Features wie Parameterattribute und Pipeline-Unterstützung.

```powershell
function Get-Quadrat {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [int]$Zahl
    )
    process {
        $Zahl * $Zahl
    }
}

1..5 | Get-Quadrat
```

👉 Weitere Infos:

```powershell
Get-Help -Name about_Functions_Advanced -ShowWindow
```

👉 **Best Practice:** Für wiederverwendbaren Code immer Funktionen schreiben – mit klaren Parameternamen und nach Möglichkeit Pipeline-Unterstützung.
