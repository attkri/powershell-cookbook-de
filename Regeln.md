# Regeln für das PowerShell-Kompendium

Titel: PowerShell Cookbook

Version: 4

Dieses Dokument bündelt **alle Regeln** für Formatierung, Struktur, Inhalte und Handling des Kompendiums.
Es ersetzt ältere Regelwerke vollständig und dient als Referenz für zukünftige Kapitel und Handlungsweisen.

## Stil & Ziel

- Kompendium = **Nachschlagewerk**, kein Seminar-Skript – als Handout für meine Teilnehmer  
- **Praxisorientiert** → Kochrezept-Stil  
- **Keine Redundanz**: doppelte Inhalte streichen, bei Bedarf Querverweise setzen  
- **Kein zusätzliches Meta-Wissen nötig**: alle wichtigen Infos direkt als Kommentar im Code. Hintergrundinfos optional am Kapitelende.  
- Es wird mit **PowerShell 7.5** und **Visual Studio Code** gearbeitet.
- **Keine Emoji's**, 'Ungleichzeichen', "Box Drawing"-Zeichen verwenden wegen der Druckerei und SW-Druck.

## Ist-Zustand

- Alles liegt unter `https://github.com/attkri/powershell-cookbook-de`
- Jedes Kapitel liegt unter ./Kompendium/ einzeln als `.md`-Datei (`Kapitel <Nr> - <Titel>.md`).
- Repository wird in VS Code bearbeitet.
- Branch `main` ist der Arbeitsstand.

### Ordnerstruktur

```asci
/ (Root)
├─ .github
│   └─ workflows
├─ .vscode
│   └─ settings.json
├─ Archiv\                                            # Nur Offline
├─ Kompendium\
│   ├─ Kapitel 1 - Einführung & Überblick.md
│   ├─ Kapitel 2 - Tools zur & für PowerShell.md
│   ├─ <usw.>
│   └─ Kapitel 42 - Best Practices & Standards.md
├─ Tools/
│   ├─ Build-Kompendium.ps1                           # Script zum Bauen des Masterdokuments
│   ├─ PandocDefaultOptionSettings.yaml
├─ .gitignore
├─ License.md                                         # CC BY-NC 4.0 und MIT für Code
├─ Kompendium.md                                      # Die Zusammengeführten Kapitel (Build-Kompendium.ps1)
├─ Kompendium.pdf                                     # Kompendium.md in PDF umgewandelt mit Pandoc über Build-Kompendium.ps1
├─ README.md                                          # Projektbeschreibung
├─ Regeln.md                                          # Dieses Dokument
└─ ToDo.md                                            # Ideen, Neue Themen, Aufgaben
```

### Inhaltsverzeichnis

- [PowerShell meistern — Kompendium](Kapitel 0 - Kompendium.md)
- [1. Einführung & Überblick](Kapitel 1 - Einführung & Überblick.md)
- [2. Tools für PowerShell](Kapitel 2 - Tools zur & für PowerShell.md)
- [3. Hilfe-System](Kapitel 3 - Hilfe-System.md)
- [4. Datentypen](Kapitel 4 - Datentypen.md)
- [5. Variablen](Kapitel 5 - Variablen.md)
- [6. Operatoren](Kapitel 6 - Operatoren.md)
- [7. Bedingungen](Kapitel 7 - Bedingungen.md)
- [8. Schleifen](Kapitel 8 - Schleifen.md)
- [9. Funktionen](Kapitel 9 - Funktionen.md)
- [10. Module](Kapitel 10 - Module.md)
- [11. Skripte](Kapitel 11 - Skripte.md)
- [12. Pipeline](Kapitel 12 - Pipeline.md)
- [13. Objekte](Kapitel 13 - Objekte.md)
- [14. Fehler und Ausnahmen](Kapitel 14 - Fehlerbehandlung.md)
- [15. Debugging](Kapitel 15 - Debugging.md)
- [16. Module und Funktionen](Kapitel 16 - Module und Funktionen.md)
- [17. PowerShell Remoting](Kapitel 17 - PowerShell Remoting.md)
- [18. Jobs und parallele Ausführung](Kapitel 18 - Jobs und parallele Ausführung.md)
- [19. Fehlerkultur & Best Practices](Kapitel 19 - Fehlerkultur & Best Practices.md)
- [20. PowerShell und Dateien](Kapitel 20 - PowerShell und Dateien.md)
- [21. Registry und Umgebungsvariablen](Kapitel 21 - Registry und Umgebungsvariablen.md)
- [22. Prozesse und Dienste](Kapitel 22 - Prozesse und Dienste.md)
- [23. Netzwerk & Verbindungen](Kapitel 23 -  Netzwerk & Verbindungen.md)
- [24. Sicherheit & Signaturen](Kapitel 24 - Sicherheit & Signaturen.md)
- [25. PowerShell Profile & Anpassung](Kapitel 25 - PowerShell Profile & Anpassung.md)
- [26. PSReadLine & Eingabeoptimierung](Kapitel 26 - PSReadLine & Eingabeoptimierung.md.md)
- [27. PowerShell Gallery & Paketmanagement](Kapitel 27 - PowerShell Gallery & Paketmanagement.md)
- [28. Versionskontrolle mit Git](Kapitel 28 - Versionskontrolle mit Git.md)
- [29. Skripte testen mit Pester](Kapitel 29 - Skripte testen mit Pester.md)
- [30. Automatisierung mit Tasks & Scheduler](Kapitel 30 - Automatisierung mit Tasks & Scheduler.md)
- [31. PowerShell in CI/CD-Pipelines](Kapitel 31 - PowerShell in CI CD-Pipelines.md)
- [32. PowerShell und REST-APIs](Kapitel 32 - PowerShell und REST-APIs.md)
- [33. JSON, XML & CSV verarbeiten](Kapitel 33 - JSON, XML & CSV verarbeiten.md)
- [34. PowerShell und WMI/CIM](Kapitel 34 - PowerShell und WMI CIM.md)
- [35. Active Directory Verwaltung](Kapitel 35 - Active Directory Verwaltung.md)
- [36. Exchange & Office 365 Verwaltung](Kapitel 36 - Exchange & Office 365.md)
- [37. Windows Management (Updates, Eventlogs, Tasks)](Kapitel 37 - Windows Management.md)
- [38. JEA (Just Enough Administration)](Kapitel 38 - JEA.md)
- [39. Linux & Cross-Plattform PowerShell](Kapitel 39 - Linux & Cross-Plattform PowerShell.md)
- [40. PowerShell und .NET-Integration](Kapitel 40 - PowerShell und .NET-Integration.md)
- [41. GUI-Tools mit PowerShell](Kapitel 41 - GUI-Tools mit PowerShell.md)
- [42. Best Practices & Standards](Kapitel 42 - Best Practices & Standards.md)

### Actions

- **Build Kompendium PDF** läuft bei Push, PR, Release oder manuell.
- Artefakte: `PowerShell_Kompendium.pdf` im Actions-Tab
- Bei Releases wird das PDF automatisch angehängt.

## Anzuwendende Regeln

### MarkdownLint-Regeln (technische Formatierung)

Die folgenden Regeln gelten für alle Markdown-Ausgaben in diesem Chat.

- **MD022 / blanks-around-headings**: Leerzeilen vor und nach Überschriften.
- **MD031 / blanks-around-fences**: Leerzeilen vor und nach Codeblöcken.
- **MD036 / no-emphasis-as-heading**: Keine *fetten/kursiven* Pseudo-Überschriften, nur echte `#`.
- **MD024 / no-duplicate-heading**: Keine doppelten Titel → ggf. Kontext ergänzen.
- **MD040 / fenced-code-language**: Codeblöcke immer mit Sprache (z. B. \`\`\`powershell).
- **MD012 / no-multiple-blanks**: Keine doppelten Leerzeilen.
- Keine `---` Trenner verwenden (Ausnahme: Kapitel 1 Übersicht).
- Das Sonderzeichen `–` in Markdown nicht benutzen sondern `-` verwenden.
- Aufzählungen immer mit '-' beginnen.

### Kapitel-Regen

- **Struktur der Kapitel**: Einleitung (2–3 Sätze) → Beispielcode → about\_-Hinweis → Best Practices.
- Zusätzliche Gestaltung: Praxisboxen, Querverweise, Mini-TOCs bei längeren Kapiteln.

### Muster-Aufbau

````markdown
# <Nr> Titel

Kurze Einleitung (2–3 Sätze): erklärt Sinn & Nutzen des Themas.

## <Nr>.<Sub_Nr> Unterthema

Kurze Beschreibung, warum/wie man es einsetzt.

<Beispiel_Code_mit_Kommentaren>

**Weitere Infos:**

<Weitere_Hinweise>

## <Nr>.<Sub_Nr> Best Practices

- Kurze Listen mit Tipps
- Kein Fülltext
- Nur praxisrelevante Hinweise
```

## 4. Inhaltliche Regeln

- **Praxisorientiert**: Rezepte statt Theorie.  
- **Keine Redundanz**: wenn Thema schon erklärt → Querverweis setzen.  
- **Beispielcode kommentieren** statt lange Absätze schreiben.  
- **Output nur wenn Mehrwert** (Bool, Typen, Vergleiche, etc.).  
- **Begriffe deutsch, Typnamen englisch** (String, Int32).  
- **Best Practices** am Ende jedes Kapitels, gesammelt wiederholt in Kapitel „Standards“.  
- **Kapitel-Einleitungen im Fließtext** (kein „Einleitung:“ Label).  
- **Große Themenblöcke** haben einen kleinen Überblick am Anfang.  
- Lange Erklärungen im Schulungsstil → kürzen  
- Redundante Beispiele entfernen / Querverweise setzen  
- Rechtschreibfehler korrigieren  
- **Überschriften** → klare Kapitelstruktur (1.1, 1.2 …), keine doppelten Titel.  
- Kommentare zu jedem Aufruf kürzer formuliert.  
- Kommentarzeilen statt Fließtext.  
- Gleiche Beispiele, nur präziser gegliedert.  
- Text durch prägnante Kommentare ersetzt.  
- Fließtext komprimiert.  
- Beispiele durch Kommentare selbsterklärend.  
- Statt Fließtext → Liste mit Links, wenn sinnvoller.  

























