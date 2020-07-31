#Demo Walk-through

#region Initial Setup: Step 1
#Create a new service principal

<#
#If your AZ CLI is not already authenticated, first login to Azure
#This will launch your deault browser to process your login
az login

#>

#Get Azure subscription ID
az account show

#If you need to change your subscription, run this:
#az account set -s "my subscription name"

$AccountJSON = az account show
$AccountObject = $AccountJSON | ConvertFrom-Json

#show account info
$AccountObject

<#
Create an Azure service principal
https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest

This will use AZ CLI to connect to Azure Active Directory and create a new service principal
We are using the following switches:

  name  -  Name of your new service principal (AZ CLI will convert this to a proper URI)
  role  -  Roles to be assigned to your service principal (what level of access it will have)
  scopes  -  List of scopes that the assigned roles for your service principal will apply to
  sdk-auth  -  Results are compatible with Azure SDK auth file (gives programmatic access to your service principal via client ID & secret)

  #>

$ServicePrincipalJSON = az ad sp create-for-rbac --name "ChicagoPowerShell-GHA-Terraform" --role contributor --scopes /subscriptions/$($AccountObject.Id) --sdk-auth

#Display the results
######NEED OBFUSCATE FUNCTION
$ServicePrincipalJSON

#endregion Initial Setup: Step 1


#region Initial Setup: Step 2
#Creating & storing Secrets in GitHub

#Navigate to your Github repository > Settings > Secrets.
#Click 'New Secret' button to create a new secret.

#We need to add a secret for clientId, clientSecret, and tenantId

$ServicePrincipalObject = $ServicePrincipalJSON | ConvertFrom-Json

#clientId
$ServicePrincipalObject.clientId | clip

#clientSecret
$ServicePrincipalObject.clientSecret | clip

#tenantId
$ServicePrincipalObject.tenantId | clip

#endregion Initial Setup: Step 2




<#
#Final Cleanup

$spId = ((az ad sp list --all | ConvertFrom-Json) | Where-Object { '<http://ChicagoPowerShell-GHA-Terraform>' -in $_.serviceprincipalnames }).objectId
az ad sp delete --id $spId

#>