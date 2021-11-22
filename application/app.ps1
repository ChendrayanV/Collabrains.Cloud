Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 80 -Protocol Http
    Set-PodeViewEngine -Type PSHTML -Extension PS1 -ScriptBlock {
        param($path, $data)
        return (. $path $data)
    }
    Add-PodeRoute -Method Get -Path '/index' -ScriptBlock {
        Write-PodeViewResponse -Path $(.\views\app.ps1)
    }
}