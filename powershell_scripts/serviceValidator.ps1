function Test-Svc  {
    param([string]$svcName)
    Write-Output "This is a test"
    return (Get-Service -Name $svcName).Status
}

function Get-AllServicesCount  {
    return (Get-Service).length
}

function Invoke-AreSvcRunnig{
    #change the number to make it failed
    $noOfService = Get-AllServicesCount
    if($noOfService -ge 234){
        return $true
    }
    return $false
}