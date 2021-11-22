Start-PodeServer -Threads 2 {
    Add-PodeEndpoint -Address * -Port 80 -Protocol Http
    Add-PodeRoute -Method Get -Path '/products' -ScriptBlock {
        Write-PodeJsonResponse -Value $( & .\routes\products.ps1)
    }
}