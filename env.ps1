$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$pathsToPrepend = @(
    Join-Path $scriptDir 'build\tools\win\gn-windows-amd64'
    Join-Path $scriptDir 'build\tools\win'
) -join ';'
$env:Path = "$pathsToPrepend;$env:Path"
Write-Host 'PATH updated for this session.'
