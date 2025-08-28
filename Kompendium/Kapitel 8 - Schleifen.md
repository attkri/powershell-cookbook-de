# 8. Schleifen

Schleifen wiederholen Anweisungen, bis eine Bedingung erfüllt ist oder eine Menge von Objekten abgearbeitet wurde.

## 8.1 For-Schleife

Eine **for-Schleife** eignet sich, wenn die Anzahl der Durchläufe bekannt ist.

```powershell
for ($i = 1; $i -le 5; $i++) {
    "Wert: $i"
}
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_For -ShowWindow
```

## 8.2 Foreach-Schleife

Mit **foreach** iterierst du direkt über alle Elemente einer Sammlung oder Pipeline.

```powershell
$liste = @("A","B","C")
foreach ($element in $liste) {
    "Element: $element"
}
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Foreach -ShowWindow
```

## 8.3 While-Schleife

Eine **while-Schleife** läuft so lange, wie die Bedingung wahr ist.

```powershell
$i = 1
while ($i -le 3) {
    "Wert: $i"
    $i++
}
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_While -ShowWindow
```

## 8.4 Do-While-Schleife

Die **do-while-Schleife** führt den Block mindestens einmal aus und prüft die Bedingung danach.

```powershell
$i = 1
do {
    "Wert: $i"
    $i++
} while ($i -le 3)
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Do -ShowWindow
```

## 8.5 Do-Until-Schleife

Die **do-until-Schleife** läuft mindestens einmal und wiederholt sich, bis die Bedingung erfüllt ist.

```powershell
$i = 1
do {
    "Wert: $i"
    $i++
} until ($i -gt 3)
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Do -ShowWindow
```

## 8.6 Break und Continue

Mit **break** wird eine Schleife beendet, mit **continue** nur der aktuelle Durchlauf übersprungen.

```powershell
for ($i = 1; $i -le 5; $i++) {
    if ($i -eq 3) { continue }  # überspringt 3
    if ($i -eq 5) { break }     # beendet Schleife
    "Wert: $i"
}
```

**Weitere Infos:**  

```powershell
Get-Help -Name about_Break -ShowWindow
Get-Help -Name about_Continue -ShowWindow
```

**Best Practice:** `foreach` bevorzugen, wenn Objekte direkt aus der Pipeline verarbeitet werden – übersichtlicher und sicherer.
