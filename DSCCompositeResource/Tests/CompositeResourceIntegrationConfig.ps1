configuration TestConfig
{
    param(
        [Parameter(Mandatory)]
        [string]$ComputerName
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration, $PLASTER_PARAM_CompositeResourceName
    
    $selectedNode = $ConfigurationData.AllNodes.Where({ $_.NodeName -eq $ComputerName })
    Node $selectedNode.NodeName
    {
        BaseConfig base1
        {
            ConfigData = $ConfigurationData
            Node = $Node
        }
        
        if ($Node.Role -eq 'FileServer')
        {
            FileServerConfig file
            {
                DependsOn = '[BaseConfig]base1'
                ConfigData = $configurationData
            } 
        }
        
        if ($Node.Role -eq 'WebServer')
        {
            WebServerConfig web
            {
                DependsOn = '[BaseConfig]base1'
                ConfigData = $configurationData
            }
        }
    }
}
