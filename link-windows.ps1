function Create-FileLink {
    param(
        [string]$SourceFilePath,
        [string]$LinkFilePath
    )

    New-Item -ItemType SymbolicLink -Path $LinkFilePath -Value $SourceFilePath
}

Create-FileLink -SourceFilePath "config\helix" -LinkFilePath "$env:USERPROFILE\AppData\Roaming\helix"
Create-FileLink -SourceFilePath "rime" -LinkFilePath "$env:USERPROFILE\AppData\Roaming\Rime"
Create-FileLink -SourceFilePath "desktop\.wezterm.lua" -LinkFilePath "$env:USERPROFILE\.wezterm.lua"
Create-FileLink -SourceFilePath "dotfiles\gitconfig" -LinkFilePath "$env:USERPROFILE\.gitconfig"
