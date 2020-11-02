# Entisys360 Azure Marketplace MVP!

![Azure Public Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/PublicLastTestDate.svg)
![Azure Public Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/PublicDeployment.svg)

![Azure US Gov Last Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/FairfaxLastTestDate.svg)
![Azure US Gov Last Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/FairfaxDeployment.svg)

![Best Practice Check](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/BestPracticeResult.svg)
![Cred Scan Check](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/CredScanResult.svg)

### Launch This Template

<a href='https://portal.azure.com/#blade/Microsoft_Azure_Compute/CreateMultiVmWizardBlade/internal_bladeCallId/anything/internal_bladeCallerParams/{"initialData":{},"providerConfig":{"createUiDefinition":"https://raw.githubusercontent.com/entisys360/Entisys360-CitrixWVD/timui201002/createUIDefination.json"}}' target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true"/>
</a>


## Introduction

To ease the manual delivery of computing of Citrix cloud over Azure solutions, Entisys360 has come up with a solution which can streamline these end user computing by automating the Citrix cloud over Azure delivery solution. The end product will be leveraging the Azure market place. The first phase the Minimum Viable Product designed will be released with from Github repos.



## The following steps outlines the features that will be released as part of the first phase (Beta release).



### Step 1

Description : Click on the Github Button.

Action:

Customer goes to Github location <link to be provided> which will be a public repository

He clicks on the “Entisys360 WVD Delivery” button in Github.

Roles involved: Customer

Output: The Customer will be redirected to the Azure portal

### Step 2

Description: Azure portal ARM template

Action:

Customer will be visualizing a pre-populated ARM form where he will need to input the required values as per their requirement.

The form will be provided with few default values which can be overwritten by the customer if required.

The form will be a paginated one with appropriate section for collecting the details inputs from the customer

An estimate calculatore which illustrates the likely cost estimate base don the data entered     will be displayed before the submission.The cost details will include the

Azure Consumption cost

Citrix License

The customer will submit the form once he inputs all the required details.

Roles involved: Customer

Output:

The form should validate the input values entered by the customer for basic requirements.

The form once submitted will execute the next steps in 2 phases



### Step 3

Description: ARM Phase one execution

Actions:

The initial bootstrap execution starts

This will setup the the initial setup using a VM extension. This involves setting up of the vnets,    subnets, VMs for domain controllers and cloud connectors.

This will also set up another VM which will be an Orchestrator VM which acts as

Controller/ worker node which will be used to host the Ansible to run the required playbooks

A storage account for the data input from the ARM template form to be used for the ARM phase two execution.

This will be henceforth referred to as the Ansible controller.

This Ansible controller performs the task of downloading the source code from the repos to    install the required binaries in the controller VM which will be used to execute the phase 2    execution.

An email should be sent for the manual intervention for both customer and Entisys360 C+A    product DL

Roles involved: Automated step

Output:

Post the first phase execution following should be available.

A Basic vNet and subnet

2 Windows 2016 VMs for Domain controllers which can be a Meraki or Azure gateway.

2 windows 2016 VMs for cloud connectors

1 VM which will act as the Controller(Orchestrator) also referred to as Ansible worker node

The VM controller which acts as a bootstrapper will perform the following

Store the data input from the ARM template form to be used in the second phase of the execution

The following binaries should be installed as part of Ansible worker node installation

Terraform

Console

Vault

Chocolaty

InSpec

The customer and the E360 C+A product DL will receive an email to complete the desired procurements and licensing.

