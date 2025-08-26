# 6. Bedingungen

Mit Bedingungen steuerst du den Ablauf von PowerShell-Skripten.  

## 6.1 If-Bedingungen

```powershell
$a = 5
if ($a -gt 3) {
    "a ist größer als 3"
}
```

## 6.2 If-Else

```powershell
$a = 2
if ($a -gt 3) {
    "a ist größer als 3"
}
else {
    "a ist kleiner/gleich 3"
}
```

## 6.3 ElseIf-Ketten

```powershell
$a = 3
if ($a -gt 5) {
    "a > 5"
}
elseif ($a -eq 3) {
    "a = 3"
}
else {
    "a ist kleiner als 5 und nicht 3"
}
```

👉 Weitere Infos:  

```powershell
Get-Help -Name about_If -ShowWindow
```

## 6.4 Switch

```powershell
$wert = "B"
switch ($wert) {
    "A" { "Wert ist A" }
    "B" { "Wert ist B" }
    default { "Unbekannt" }
}
```

👉 Weitere Infos:  

```powershell
Get-Help -Name about_Switch -ShowWindow
```

👉 **Best Practice:** Switch nutzen, wenn viele Vergleiche nötig sind – übersichtlicher als viele `elseif`.
