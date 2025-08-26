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

- MD031/blanks-around-fences: Fenced code blocks should be surrounded by blank

- **Keine `---` Trenner** verwenden.  

## 3. Inhalte & Struktur

- **Tastaturbefehle** → nicht kürzen, komplette Tabellen beibehalten, bzw. mit Attila abstimmen  
- **Überschriften** → immer klare Kapitelstruktur (1.1, 1.2 …), keine doppelten Titel.  
- **about_-Seiten** → immer direkt im jeweiligen Unterkapitel mit `Get-Help -Name ... -ShowWindow` angeben, nicht gesammelt am Kapitelanfang.  

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
  - Zu jedem Punkt 1., 2., 3. usw. und dessen Unterpunkt 7.1, 7.2, 7.3, use. immer ein Einleitung schreiben.
