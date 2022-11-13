# Installation mit Adminrechten!
Install-Module platyps -Force

# Import des Modules
Import-Module D:\Serioese_Projekte\Juventus\Module\TestCmdLet\bin\Release\net6.0\TestCmdLet.dll

#
# ausführen des Modules
#

#mit Pipeline
"Herbert", "Markus" | Get-Greeting
# mit Params
Get-Greeting -Name "Herbert", "Markus"
# mit Alias des Params
Get-Greeting -N "Herbert", "Markus"

#
# Hilfedatei erstellen:
#

# schauen ob das Modul Importiert wurde:
Get-Module
# Neues Helpfile erzeugen
Import-Module platyps
$OutputFolder = "D:\Serioese_Projekte\Juventus\Module\TestCmdLet\bin\Release\net6.0\"
$parameters = @{
    Module                = "TestCmdLet"
    OutputFolder          = $OutputFolder
    AlphabeticParamsOrder = $true
    WithModulePage        = $true
    ExcludeDontShow       = $true
    Encoding              = [System.Text.Encoding]::UTF8
}
# generiert die .md files, welche nur noch bearbeitet werden müssen.
New-MarkdownHelp @parameters
New-MarkdownAboutHelp -OutputFolder $OutputFolder -AboutName "Get_Greeting"

# Update der MAML-Hilfe, nachdem die .md Datein korrekt sind
Update-MarkdownHelpModule -Path $OutputFolder -RefreshModulePage

# Erstellen der .xml-Hilfedatei
New-ExternalHelp -Path $OutputFolder -OutputPath "D:\Serioese_Projekte\Juventus\Module\TestCmdLet\bin\Release\net6.0\en-US" -Force

# Preview der Hilfe
# auch mögliche Pfade: fr-FR
Get-HelpPreview -Path "D:\Serioese_Projekte\Juventus\Module\TestCmdLet\bin\Release\net6.0\en-US\TestCmdLet.dll-Help.xml"

# Get-Help
Get-Help Get-Greeting -Detailed

# Greeting holen
"Herbert", "Markus" | Get-Greeting

# Greeting mit Namen holen
$out = Get-Greeting -N "Herbert", "Markus"
$out | Get-Member