If(Get-Module -ListAvailable -Name "Pester")
{
   $moduleroot = Split-Path -Parent $MyInvocation.MyCommand.Path
   Write-Output "Pester is installed performing test"
 
    Invoke-Pester $moduleroot/../specs/*.ps1
}else {
    Write-Output "INSTALLING PESTER..."
}