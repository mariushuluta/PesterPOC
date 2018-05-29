function Test-Svc  {
    param([string]$svcName)
    Write-Output "This is a test"
    return (Get-Service -Name $svcName).Status
}