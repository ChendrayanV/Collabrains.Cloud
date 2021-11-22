Start-PodeServer -Threads 2 {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http
    Set-PodeViewEngine -Type PSHTML -Extension PS1 -ScriptBlock {
        param($path, $data)
        return (. $path $data)
    }
    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
        Write-PodeViewResponse -Path 'index.ps1'
    }
}   