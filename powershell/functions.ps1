function rebuild {

    [CmdletBinding()]

    param (
        [Parameter()]
        [string] $ModuleDir = "."
    )

    $ModuleDir = Resolve-Path $ModuleDir

    if ( !(Test-Path "$ModuleDir\Source\build.psd1") ) {
        throw "$ModuleDir doesn't look like a Powershell module root directory"
    }

    $moduleName = Split-Path -Leaf $ModuleDir
    Write-Host "Rebuilding ${moduleName}..."

    Push-Location "$ModuleDir\Source"
    Build-Module
    Pop-Location

    if( Get-Module $moduleName ) {
        Remove-Module $moduleName
    }

    Import-Module "$ModuleDir\bin\$moduleName"
}

