$configurationData = Import-DscConfigurationData -Path $PSScriptRoot\Config -GlobalConfigurationFileName GlobalConfigurationData.psd1 -ErrorAction Stop

$configurationData
#Publish-DscConfiguration -ComputerName $configurationData.AllNodes.NodeName -ConfigurationData $configurationData -Configuration (Get-Command -Name DemoConfig1) -OutputPath C:\DscMofs