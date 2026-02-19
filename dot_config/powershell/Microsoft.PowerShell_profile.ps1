# Microsoft.PowerShell_profile.ps1

# Set UTF-8 encoding for input and output
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Initialize mise
$env:MISE_PWSH_CHPWD_WARNING=0 # Disable warning about changing directory for PowerShell 5
(&mise activate pwsh) | Out-String | Invoke-Expression

# Setup starship prompt
Invoke-Expression (&starship init powershell)

# List history by default (Toggle by F2 key)
Set-PSReadLineOption -PredictionViewStyle ListView

# Set fzf options
$env:FZF_DEFAULT_OPTS="--height 50% --layout=reverse"

# History search (PSFzf)
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Tab completion (PSFzf)
Set-PsFzfOption -TabExpansion

# zoxide (z and zi)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
