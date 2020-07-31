#Quick Environment Prep

<#
#Install Chocolatey - https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#>

choco install vscode
choco install vscode-powershell
choco install azure-cli
choco install terraform

#Optional - Github CLI & tflint
choco install gh
choco install tflint
