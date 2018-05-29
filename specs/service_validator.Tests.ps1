$moduleroot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Load Testing Function
#. "$moduleroot\psscripts\verifySvc.ps1"
 Set-Location $moduleroot
 Set-Location ..
 . "powershell_scripts\serviceValidator.ps1"

Describe "Testing services"{
    Mock Test-Svc {return "Runnig"}

    It "if check iis service should be Stoped"{
        Test-Svc | Should Be "Stoped"
    }
}