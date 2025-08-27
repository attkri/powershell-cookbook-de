#region Pandoc

#
# Install
#

winget install --id JohnMacFarlane.Pandoc
winget install MiKTeX

#
# Create PDF
#

Pandoc.exe .\Private\PowerShell_meistern.md --output=.\Private\PowerShell_meistern.pdf --defaults=.\Private\PandocDefaultOptionSettings.yaml -V block-headings

Pandoc --list-highlight-styles
Pandoc --list-highlight-languages

# file:///C:/Program%20Files/Pandoc/Pandoc%20User's%20Guide.html
# https://vijual.de/2019/03/11/artikel-mit-markdown-und-pandoc-schreiben/
# https://www.uv.es/wikibase/doc/cas/pandoc_manual_2.7.3.wiki?20
# https://pandoc.org/MANUAL.html

#endregion
