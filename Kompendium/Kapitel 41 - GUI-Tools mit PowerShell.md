# 41. GUI-Tools mit PowerShell

PowerShell kann nicht nur in der Konsole genutzt werden, sondern auch grafische Oberflächen erzeugen. Dazu lassen sich Windows Forms (WinForms) oder Windows Presentation Foundation (WPF) einsetzen.

```powershell
Get-Help -Name 'Show-Command' -ShowWindow
```

## 41.1 Grundlagen

* **WinForms**: Einfach, schnell für kleine Tools.
* **WPF**: Moderner, flexibler, trennt Oberfläche (XAML) und Logik.

PowerShell kann beide Varianten direkt verwenden, da sie auf .NET basieren.

## 41.2 Einfache WinForms

Mit WinForms lassen sich schnell kleine Dialoge bauen.

```powershell
Add-Type -AssemblyName System.Windows.Forms

$form = New-Object Windows.Forms.Form
$form.Text = "Demo-Formular"
$form.Size = '300,200'

$button = New-Object Windows.Forms.Button
$button.Text = "Klick mich"
$button.Dock = 'Fill'
$button.Add_Click({ [Windows.Forms.MessageBox]::Show("Hallo Welt") })

$form.Controls.Add($button)
$form.ShowDialog()
```

## 41.3 WPF mit XAML

Mit WPF lassen sich komplexere GUIs über XAML-Dateien beschreiben.

```powershell
Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Demo" Height="200" Width="300">
    <Grid>
        <Button Name="BtnHallo" Content="Sag Hallo" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$button = $window.FindName("BtnHallo")
$button.Add_Click({ [System.Windows.MessageBox]::Show("Hallo aus WPF") })

$window.ShowDialog()
```

## 41.4 Events und Logik

GUI-Elemente können Events auslösen, die mit Skriptlogik verknüpft werden.

```powershell
$button.Add_Click({
    $form.Text = "Button wurde geklickt!"
})
```

## 41.5 Best Practices

* Für kleine Tools → WinForms nutzen.
* Für komplexere Anwendungen → WPF mit XAML.
* Logik und Oberfläche trennen (Code vs. XAML).
* GUI-Tools dokumentieren und testen – sie sind fehleranfälliger als reine Skripte.

```powershell
# Beispiel: Einfaches Eingabefeld
Add-Type -AssemblyName Microsoft.VisualBasic
$eingabe = [Microsoft.VisualBasic.Interaction]::InputBox("Bitte Namen eingeben:", "Eingabe", "Attila")
"Hallo $eingabe"
```
