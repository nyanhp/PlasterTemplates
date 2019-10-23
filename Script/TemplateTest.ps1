$scriptPath = Join-Path -Path (Get-Item -Path $PSScriptRoot).Parent -ChildPath <%= $PLASTER_PARAM_ScriptName %>.ps1

Describe '<%= $PLASTER_PARAM_ScriptName %>' {
    It 'Should do something' {
        & $scriptPath | Should Be "Something"
    }
}