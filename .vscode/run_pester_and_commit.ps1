 $moduleroot = Split-Path -Parent $MyInvocation.MyCommand.Path
  Write-Output "Pester is installed performing test"
  Import-Module $moduleroot\pester_helper.psm1
  Install-PesterIfNotInstalled
  $failuers = Invoke-Tests
  Invoke-GitCheckIn -numberOfFailuers $failuers
  
