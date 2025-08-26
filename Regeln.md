# Regeln für das PowerShell-Kompendium

Titel: PowerShell meistern

## 1. Stil & Ziel

- Kompendium = **Nachschlagewerk**, kein Seminar-Skript – als Handout für meine Teilnehmer  
- **Fakten + kurze Erklärung (2–3 Sätze) + Beispielcode**  
- **Praxisorientiert** → Kochrezept-Stil  
- **Keine Redundanz**: doppelte Inhalte streichen, bei Bedarf Querverweise setzen  
- **Kein zusätzliches Meta-Wissen nötig**: alle wichtigen Infos direkt als Kommentar im Code. Hintergrundinfos optional am Kapitelende.  
- Es wird mit **PowerShell 7.5** und **Visual Studio Code** gearbeitet.  

## 2. MarkdownLint-Regeln (Formatierung)

- **MD022 / blanks-around-headings**  
  Überschriften immer mit Leerzeilen davor und danach.  

- **MD031 / blanks-around-fences**  
  Codeblöcke immer mit Leerzeilen davor und danach.  

- **MD036 / no-emphasis-as-heading**  
  Keine *kursiv* oder **fett** als Überschrift – immer echte `#`-Headings verwenden.  

- **MD024 / no-duplicate-heading**  
  Keine doppelten Überschrift-Texte. → Bei Bedarf mit Kontext ergänzen:  
  `### Tastaturbefehle (Konsole)` vs. `### Tastaturbefehle (VSCode)`.  

- **MD040 / fenced-code-language**  
  Codeblöcke immer mit Sprache markieren (z. B. ```powershell).  

- **MD012 / no-multiple-blanks**  
  Keine mehrfachen Leerzeilen.  

- **Keine `---` Trenner** verwenden.  

- Das Zeichen – nie benutzen sondern durch - ersetzen.

## 3. Inhalte & Struktur

- **Tastaturbefehle** → nicht kürzen, komplette Tabellen beibehalten, bzw. mit Attila abstimmen  
- **Überschriften** → immer klare Kapitelstruktur (1.1, 1.2 …), keine doppelten Titel.  
- **about_-Seiten** → immer direkt im jeweiligen Unterkapitel mit `Get-Help -Name ... -ShowWindow` angeben, nicht gesammelt am Kapitelanfang.  
- **Jedes Haupt- und Unterkapitel (z. B. 7.1, 7.2 …)** beginnt mit 1–2 Sätzen **Einleitung im Fließtext**, bevor Beispielcode folgt.  

## 4. Abarbeitung

- Immer **Kapitelweise Vorher/Nachher linear anzeigen**, gefolgt von einer kurzen Erklärung der gemachten Änderungen.  

- Folgende Punkte können **ohne diese Vorher/Nachher/Beschreibung Darstellung** direkt umgesetzt werden, da der Umsetzung vertraut wird:  
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
  - Beispiel-Output nur dann, wenn er einen echten Mehrwert bringt → z. B. bei booleschen Ausdrücken, Typ-Prüfungen, Vergleichsoperatoren. Kein Platzfüller.  
  - Begriffe durchgängig deutsch, aber Typnamen im Code Englisch → z. B. „Zeichenkette (String)“, „Ganzzahl (Int32)“.  
  - **Best Practices** hervorheben und für Kapitel *Best Practice* aufheben.  
  - **about_-Seiten** gezielt im passenden Unterkapitel angeben, nicht zentral gesammelt.  

## 5. Kapitel-Ausgabe

- Jedes Kapitel wird als **eigenständige `.md`-Datei** erstellt (`Kapitel_X.md`).  
- Ausgabe **immer per Datei (Create_TextDoc)**, nicht nur als Markdown im Chat.  
- Chat-Nachrichten dienen nur zur **Status-Meldung** (z. B. „Kapitel 14 fertig“), nicht für die eigentliche Datei.  
- So bleibt das Kompendium konsistent und direkt für GitHub nutzbar.  

## 6. Musterbeispiel

Dateiname: **Kapitel 8 – Funktionen.md**

### Inhalt (gekürzt)

```markdown
# Kapitel 8 – Funktionen

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
```

➡️ Dieses Muster zeigt: Einleitung → Beispielcode → `about_`-Hinweis. Alle Kapitel folgen dieser Struktur.
