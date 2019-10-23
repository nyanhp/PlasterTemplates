<#
.SYNOPSIS
    <%= $PLASTER_PARAM_Description %>
.DESCRIPTION
    <%= $PLASTER_PARAM_Description %>
.NOTES
    Author  : <%= $PLASTER_PARAM_FullName %>
    Date    : <%= (Get-Date).ToString('yyyy-MM-dd') %>
    Version : <%= $PLASTER_PARAM_ScriptVersion %>
#>

<%
if ($PLASTER_PARAM_UseParameters -eq 'Yes')
{
@'
param
(
    [Parameter(Mandatory = $true)]
    $ParameterName1,

    $ParameterName2
)
'@
}
%>
