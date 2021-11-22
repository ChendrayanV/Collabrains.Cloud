FROM mcr.microsoft.com/powershell:latest

WORKDIR /usr/src/app/

COPY . .    

RUN pwsh -c "Install-Module 'Pode' -Force -AllowClobber"

CMD [ "pwsh", "-c", "cd /usr/src/app; ./server.ps1" ]