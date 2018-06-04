$moduleroot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Load Testing Function
#. "$moduleroot\psscripts\verifySvc.ps1"
 Set-Location $moduleroot
 Set-Location ..
 . "powershell_scripts\serviceValidator.ps1"

Describe "Testing services"{
    Mock Test-Svc {return "Stoped"}
    #chage the number to make it failed
    Mock Get-AllServicesCount {return 234}

    It "if check iis service should be Stoped"{
        Test-Svc | Should Be "Stoped"
    }

    It "If all services are runnig the ressult should be true"{
        Invoke-AreSvcRunnig | Should Be $true
    }
}