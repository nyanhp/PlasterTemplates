if (-not (Get-Module Hyper-V -ListAvailable))
{
    Write-Verbose 'Hyper-V module not present. Skipping test.'
    return
}

. .\TestConfiguration.ps1 # Import DSC Configuration from file

Install-Module AutomatedLab -Force # Prepare small lab environment

New-LabDefinition -Name $PLASTER_PARAM_CompositeResourceName -DefaultVirtualizationEngine HyperV
$os = Get-LabAvailableOperatingSystem | Sort-Object -Property Version -Descending | Select-Object -First 1 -ExpandProperty OperatingSystemName
Add-LabMachineDefinition -Name VM1 -OperatingSystem $os
Install-Lab

$session = New-LabPSSession -ComputerName VM1
