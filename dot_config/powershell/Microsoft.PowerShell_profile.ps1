# Microsoft.PowerShell_profile.ps1

# Set UTF-8 encoding for input and output
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Initialize mise
if (Get-Command mise -ErrorAction SilentlyContinue) {
    $env:MISE_PWSH_CHPWD_WARNING=0 # Disable warning about changing directory for PowerShell 5
    (&mise activate pwsh --shims) | Out-String | Invoke-Expression
}

# Setup starship prompt
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# Set fzf options
$env:FZF_DEFAULT_OPTS="--height 50% --layout=reverse"

if (Get-Command Set-PsFzfOption -ErrorAction SilentlyContinue) {
    # History search (PSFzf)
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

    # Tab completion (PSFzf)
    if ($PSVersionTable.PSVersion.Major -ge 6) {
        Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
        Set-PsFzfOption -TabExpansion
    }
}

# zoxide (z and zi)
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# Load machine-local settings if present
$localProfile = Join-Path (Split-Path $PROFILE) "profile.local.ps1"
if (Test-Path $localProfile) { . $localProfile }
