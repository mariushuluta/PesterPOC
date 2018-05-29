function Test-Svc  {
    param([string]$svcName)
    return (Get-Service -Name $svcName).Status
}