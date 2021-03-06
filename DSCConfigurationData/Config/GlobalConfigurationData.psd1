@{
    AllNodes = @(
        @{
            NodeName = '*'
            RetryCount = 20
            RetryIntervalSec = 30
            #PSDscAllowPlainTextPassword = $true
            PSDscAllowDomainUser = $true
        }
    )

	ShareName = 'Tools'
	SharePath = 'C:\Tools'

    DnsSuffix = 'contoso.com'

    Domains = @{
        'contoso.com' = @{
            Type = 'RootDomain'
            Name = 'contoso.com'
            DN = 'DC=contoso,DC=com'
        
            QueryCredentials = New-Object pscredential('contoso\install', ('Somepass1' | ConvertTo-SecureString -AsPlainText -Force))
            AdminCredentials = New-Object pscredential('contoso\install', ('Somepass1' | ConvertTo-SecureString -AsPlainText -Force))
        }
    }
}