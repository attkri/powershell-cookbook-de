# Kapitel 1 – Tools für PowerShell

Tools die das arbeiten mit bzw. in der PowerShell erleichtern.

## 1.1 Vorbereitung

Installiere die Schriftart [Cascadia Code](https://github.com/microsoft/cascadia-code).  
Sie ist optimiert für Programmierung und sorgt für bessere Lesbarkeit in PowerShell & VSCode.

---

## 1.2 PowerShell-Konsole

### Starten

```powershell
Start-Process "C:\Program Files\PowerShell\7\pwsh.exe"
```

💡 Tipp: Nutze [Windows Terminal](https://github.com/microsoft/terminal), um PowerShell, CMD & Bash in Tabs oder Splits zu verwenden.

### Tastaturbefehle

| Tastaturbefehle    | Beschreibung                                                        |
| ------------------ | ------------------------------------------------------------------- |
| TAB                | Befehlszeilenergänzung                                              |
| STRG + C           | Abbruch (oder Kopieren ab v5.0)                                     |
| PFEIL-OBEN/-UNTEN  | Blättert im Befehls-Cache                                           |
| MARKIERUNG + ENTER | Kopiert die Markierung in die Zwischenablage                        |
| RECHTS-KLICK       | Fügt die Zwischenablage ein                                         |
| STRG + V           | Einfügen (>= 5.0)                                                   |
| STRG + SPACE       | Vorschlagsliste & Autovervollständigung für Parameter und Argumente |

### History verwalten

```powershell
Get-History
$MaximumHistoryCount = 4096 # Achtung: Default-Wert, nicht reduzieren!
```

### Konsolen-Logging (Transcript)

```powershell
Start-Transcript C:\Temp\ps.log
# ... Befehle ausführen ...
Stop-Transcript
Get-Content C:\Temp\ps.log
```

### Anzeigeoptionen anpassen

```powershell
$FormatEnumerationLimit = -1  # unbegrenzt statt Default=4
```

---

## 1.3 Script Analyzer

### Code-Check

```powershell
Invoke-ScriptAnalyzer -Path .\script.ps1
Get-ScriptAnalyzerRule

# Formatieren
Invoke-Formatter -ScriptDefinition $definition
```

💡 In VSCode sind Regelverstöße direkt im *Problems*-Fenster sichtbar.

---

## 1.4 Visual Studio Code

Empfohlen als Editor (Nachfolger der ISE)

### Obligatorische Extensions

| Titel              | ID                                                                                   | Beschreibung                    |
| ------------------ | ------------------------------------------------------------------------------------ | ------------------------------- |
| PowerShell         | ms-vscode.powershell                                                                 | PowerShell (.PS1) Integration   |
| Better Comments    | aaron-bond.better-comments                                                           | Kommentare farblich hervorheben |
| Code Spell Checker | streetsidesoftware.code-spell-checker + streetsidesoftware.code-spell-checker-german | Rechtschreibprüfung (EN/DE)     |

### Optionale Extensions

| Titel                   | ID                                | Beschreibung                           |
| ----------------------- | --------------------------------- | -------------------------------------- |
| Markdown All in One     | yzhang.markdown-all-in-one        | Markdown (.md) Integration             |
| Markdown PDF            | yzane.markdown-pdf                | Markdown → PDF Export                  |
| MarkdownLint            | davidanson.vscode-markdownlint    | Markdown Style-Checking                |
| XML Tools               | dotjoshjohnson.xml                | XML Integration                        |
| Vscode Google Translate | funkyremi.vscode-google-translate | Übersetzungstool                       |
| Pester                  | ps-pester.pester                  | Framework für Unit-Tests in PowerShell |

### Visual Studio Code Tastaturbefehle

| Beschreibung                     | Tastenkürzel   |
| -------------------------------- | -------------- |
| Zeile/Selektion ausführen        | F8             |
| Online-Hilfe zum Cmdlet          | CTRL+F1        |
| Alle Regionen einklappen (PS1)   | CTRL+K, CTRL+8 |
| Alles einklappen (MD)            | CTRL+K, CTRL+0 |
| Alles aufklappen                 | CTRL+K, CTRL+J |
| Debugger starten (PS1 ausführen) | F5             |
| Autovervollständigung öffnen     | CTRL+SPACE     |
| Dateien schnell öffnen           | CTRL+P         |
| Zeile nach unten verschieben     | ALT+DOWN       |
| Zeile(n) ein-/auskommentieren    | CTRL+#         |

💡 Alle Keybindings sind in `keybindings.json` anpassbar.

---

## 1.5 Windows Terminal

### Features

- Mehrere Shells in Tabs & Splits  
- Transparenz, Themes, Copy/Paste  
- Download: [Microsoft Store](https://aka.ms/terminal) oder [GitHub](https://github.com/microsoft/terminal)

### Windows Terminal Tastaturbefehle

| Beschreibung               | Kürzel          |
| -------------------------- | --------------- |
| Suchen                     | CTRL+SHIFT+F    |
| Neuer vertikaler Bereich   | ALT+SHIFT++     |
| Neuer horizontaler Bereich | ALT+SHIFT+-     |
| Bereich wechseln           | ALT+PFEILTASTEN |
| Bereich schließen          | CTRL+SHIFT+W    |

---

## 1.7 PowerShell ISE (Legacy)

Nicht mehr aktiv entwickelt, nur noch für alte Skripte relevant.  

💡 Empfehlung: **VSCode mit PowerShell-Extension**.

---

## 1.8 Weitere Tools

- [CryptPad](https://cryptpad.fr) → kollaboratives Arbeiten  
- [RegEx101](https://regex101.com) → Regex testen
