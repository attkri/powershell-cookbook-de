# 6. Operatoren

PowerShell bietet eine Vielzahl von Operatoren für Vergleiche, Berechnungen und Logik.

## 6.1 Arithmetische Operatoren

```powershell
5 + 3   # Addition → 8
5 - 3   # Subtraktion → 2
5 * 3   # Multiplikation → 15
5 / 3   # Division → 1,666...
5 % 3   # Modulo → 2
```

## 6.2 Vergleichsoperatoren

```powershell
5 -eq 5    # Gleich → True
5 -ne 4    # Ungleich → True
5 -gt 3    # Größer als → True
5 -lt 10   # Kleiner als → True

"Test" -eq "test"   # True (nicht case-sensitiv)
"Test" -ceq "test"  # False (case-sensitiv)
```

## 6.3 Logische Operatoren

```powershell
$true  -and $false   # False
$true  -or  $false   # True
-not $true           # False
```

## 6.4 Zuweisungsoperatoren

```powershell
$a = 5
$a += 3    # 8
$a -= 2    # 6
$a *= 4    # 24
$a /= 6    # 4
```

**Best Practice:** Zuweisungsoperatoren sparsam nutzen – sie verkürzen Code, können aber die Lesbarkeit mindern.
