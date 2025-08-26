# Kapitel 3 – Datentypen

In PowerShell hat jeder Wert einen Datentyp.  
Variablen sind dynamisch, können aber mit **Typ-Literalen** festgelegt werden.  

## 3.1 Einführung

```powershell
$a = 5
$a.GetType()        # System.Int32

$a = "Text"
$a.GetType()        # System.String

[string]$b = 42
$b.GetType()        # System.String
```

## 3.2 Wichtige Standard-Datentypen

- Ganzzahl (Int32)  
- Gleitkommazahl (Double)  
- Zeichenkette (String)  
- Wahrheitswert (Boolean)  
- Datum/Zeit (DateTime)  

```powershell
[int]$zahl    = 42        # Ganzzahl
[string]$text = "Hallo"   # Zeichenkette
[bool]$wahr   = $true     # Wahrheitswert
[datetime]$d  = Get-Date  # Datum/Zeit
```

## 3.3 Typumwandlungen

```powershell
[int]"42"            # String → Ganzzahl
[string]123          # Zahl → String
[datetime]"2025-01-01"  # String → Datum

"123".ToString()     # Zahl/String → Text
[bool]0              # False
[bool]1              # True
```

👉 Manche Umwandlungen schlagen fehl:
```powershell
[int]"abc"           # Fehler
```

## 3.4 Arrays und Hashtables

```powershell
# Array
$a = @(1,2,3)
$a[0]        # Zugriff erstes Element → 1
$a.Length    # Länge → 3

# Hashtable
$h = @{Name="Attila"; Ort="Würzburg"}
$h["Name"]   # Zugriff über Schlüssel → Attila
$h.Ort       # Zugriff über Property → Würzburg
```

## 3.5 Objekte und Eigenschaften/Methoden

```powershell
$p = Get-Process -Id $PID

# Eigenschaften
$p.ProcessName   # Prozessname
$p.Id            # Prozess-ID

# Methoden
$p.Kill()        # Prozess beenden
"Hallo".ToUpper() # String in Großbuchstaben
```

## 3.6 Besonderheiten von Null und `$null`

`$null` steht für **kein Wert**.  
👉 **Best Practice:** `$null` immer links im Vergleich schreiben.  

```powershell
$a = $null
$null -eq $a     # True
$a -eq $null     # True (funktioniert, aber schlechter Stil)

$a = ""
$null -eq $a     # False (leer ≠ null)
```

## 3.7 Operatoren für Typprüfung und Casting

```powershell
"Text" -is [string]   # True
42 -is [int]          # True
42 -is [string]       # False

"42" -as [int]        # 42
"abc" -as [int]       # $null (fehlgeschlagen)
```

## 3.8 Vergleichsoperatoren

```powershell
5 -eq 5    # Gleich
5 -ne 4    # Ungleich
5 -gt 3    # Größer als
5 -lt 10   # Kleiner als

"Test" -eq "test"   # True (nicht case-sensitiv)
"Test" -ceq "test"  # False (case-sensitiv)
```

## 3.9 Logische Operatoren

```powershell
$true  -and $false   # False
$true  -or  $false   # True
-not $true           # False
```

## 3.10 Collections und Enumerables

```powershell
# Liste mit mehreren Werten
$list = 1..5

foreach ($i in $list) {
    $i * 2  # Ausgabe: 2,4,6,8,10
}
```

## 3.11 Zeichenketten (Strings)

```powershell
$name = "Attila"

# Verkettung
"Hallo " + $name     # Hallo Attila

# Interpolation
"Hallo $name"        # Hallo Attila

# Länge
$name.Length          # 6
```

## 3.12 Escape-Sequenzen

```powershell
"Zeile1`nZeile2"   # Neue Zeile
"Tab`tgetrennt"    # Tabulator
```

## 3.13 Reguläre Ausdrücke (Regex)

```powershell
"abc123" -match "[a-z]+[0-9]+"   # True

$matches[0]   # abc123
```

## 3.14 Zahlenformate

```powershell
# Zahl formatieren
$zahl = 1234.56

"{0:N2}" -f $zahl   # 1.234,56 (2 Nachkommastellen)
"{0:C}" -f $zahl    # Währungsformat
```
