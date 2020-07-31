__Prerequisites for this walk-through:__

_Accounts:_
* Microsoft Azure subscription (I'm using my personal Pay-As-You-Go subscription)  
  > You will create a new Azure service principal to use for this demo

* Terraform Cloud account (this is free for remote state storage)  
* A GitHub repository for this walk-through, you can use a clone of this repository  
  > You will need to add your Azure service principal credentials & Terraform Cloud API token to the GitHub repository secrets  

_Software:_
* Visual Studio Code (my final testing of this code was using version 1.47.3)  
* AZ CLI installed (my final testing of this code was using version 2.8.0)  
* Terraform installed (my final testing of this code was using version v0.12.28)  

_Code:_
* Our demo repository cloned to your computer