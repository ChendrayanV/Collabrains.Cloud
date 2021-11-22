Start-PodeServer -Threads 2 {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http
    Add-PodeRoute -Method Get -Path '/getdata' -ScriptBlock {
        Write-PodeJsonResponse -Value $( & .\views\products.ps1 )
    }
}