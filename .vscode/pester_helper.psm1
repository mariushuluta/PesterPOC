function Invoke-Tests  {
    $failuers = (Invoke-Pester  $moduleroot/../specs/*.ps1 -PassThru | 
    Select-Object -ExpandProperty TestResult | Where-Object {-not $_.passed})
    return $failuers
}

function Invoke-GitCheckIn{
    param([int]$numberOfFailuers)
    if($numberOfFailuers -le 0){
        $comment = Read-Host -Prompt "Please enter commit comment"
        git add .
        git commit -m $comment
        git push
    }
}

function Install-PesterIfNotInstalled{
    If((Get-Module -Name "Pester" -ListAvailable).length -eq 0){
        Write-Output "Pester is installed performing test"
        Install-Module -Name Pester -Force -SkipPublisherCheck
    }
}

Export-ModuleMember -function Invoke-Tests, Invoke-GitCheckIn, Install-PesterIfNotInstalled