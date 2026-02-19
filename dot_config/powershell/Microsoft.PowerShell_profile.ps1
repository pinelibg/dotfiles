# Microsoft.PowerShell_profile.ps1

# Set UTF-8 encoding for input and output
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Setup starship prompt
Invoke-Expression (&starship init powershell)

# List history by default (Toggle by F2 key)
Set-PSReadLineOption -PredictionViewStyle ListView

# Set fzf options
$env:FZF_DEFAULT_OPTS="--height 50% --layout=reverse"

# History search with fzf using PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Tab completion with using PSFzf
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PsFzfOption -TabExpansion

# zoxide (z and zi)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
