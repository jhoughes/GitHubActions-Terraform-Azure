#Demo Walk-through

#region Initial Setup: Step 1
#Create a new service principal

<#
#If your AZ CLI is not already authenticated, first login to Azure
#This will launch your default browser to process your login
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
#Final Service PrincipalCleanup

$spId = ((az ad sp list --all | ConvertFrom-Json) | Where-Object { '<http://ChicagoPowerShell-GHA-Terraform>' -in $_.serviceprincipalnames }).objectId
az ad sp delete --id $spId

#>


<#

Set up for the demo:

*Go to https://app.terraform.io/ to create an organization & workspace, connect it to Github, and create an API token to add to your GitHub repository secrets.*

*Note: Again, add these secrets to your GitHub repository before you start.*

GH_AZ_SUBSCRIPTION - this is your Azure subscription ID
GH_AZ_CLIENTID - this is your service principal client ID
GH_AZ_CLIENTSECRET - this is your service principal client secret
GH_AZ_TENANTID - this is your service principal tenant ID
GH_TF_API_TOKEN - this is your Terraform Cloud API token

*Note: Also, to make this functional for you, upload your public ssh key as 'github_actions_demo.pub' to have it imported.*

Running the demo (as it was in the live session):

From this point, to follow the you can just move each of the sets of files from the './tf-files' directory to the root directory.
Edit the *.auto.tfvars for your own variables for your environment & deployment.
Then when you either pull or push to the repository, you should see the workflows run.

Fix any errors in the files, let your workflows run, and commit some code.

Final Cleanup:

To delete resources at the end, go into the 'Actions' tab, and open the 'Manual Terraform Destroy' workflow.
Click the 'Run Workflow' button on the right side, tell it to use the workflow from the 'main' branch, then click 'Run Workflow'.
Go back to the Actions tab, and watch your 'Manual Terraform Destroy' workflow start a job to nuke it all.


Thanks for playing. :)
#>