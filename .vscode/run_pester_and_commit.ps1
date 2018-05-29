If(Get-Module -ListAvailable -Name "Pester")
{
   $moduleroot = Split-Path -Parent $MyInvocation.MyCommand.Path
   Write-Output "Pester is installed performing test 22"
 
    Invoke-Pester $moduleroot/../specs/*.ps1 -Show Failed,Summary
    git add .
    $comment = Read-Host -Prompt "Enter your comment"
    git commit -m $comment
    git push
}else {
    Write-Output "INSTALLING PESTER..."
}