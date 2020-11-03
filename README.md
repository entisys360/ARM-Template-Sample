# Entisys360 Azure Marketplace MVP!

![Azure Public Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/PublicLastTestDate.svg)
![Azure Public Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/PublicDeployment.svg)

![Azure US Gov Last Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/FairfaxLastTestDate.svg)
![Azure US Gov Last Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/FairfaxDeployment.svg)

![Best Practice Check](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/BestPracticeResult.svg)
![Cred Scan Check](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/CredScanResult.svg)

### Launch This Template

<a href='https://portal.azure.com/#blade/Microsoft_Azure_Compute/CreateMultiVmWizardBlade/internal_bladeCallId/anything/internal_bladeCallerParams/{"initialData":{},"providerConfig":{"createUiDefinition":"https%3A%2F%2Fraw.githubusercontent.com%2Fentisys360%2FEntisys360-CitrixWVD%2Ftimui201002%2FcreateUIDefination.json"}}' target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true"/>
</a>


## Introduction to Desktop360

Regardless of what business you’re in, your workforce relies on applications to get things done, and different job roles call for different resources. Productivity is entirely dependent upon access to the right applications at the right time, but security is a critical and permanent requirement.

With Desktop360, you get improved speed of delivery, greater flexibility and enhanced workplace scenarios direct from the Azure Marketplace to deliver the Citrix Cloud over Azure solution from Entisys360.

If you have any quesitons or need assistance with these configuration steps, please contact Entisys360 support at 877-ENTISYS (877-368-4797) – Opt 9 or email support at support@entisys360.com.



## Installation Steps
### ( Entisys360 Internal Beta release )

To complete the installation of the Desktop360 product, there are two phases:

### Phase 1: Complete the initial configuration form data fields, and Submit.

The initial automation and configuration will build the preliminary environment resources into the customer's subscription of choice. Email notifications are then sent to the customer and internal Entisys360 sales/support staff.

The internal sales and support staff will follow through with the email notifications to then work with the customer to complete the following steps:
- Establish connectivity from Azure to On-Premises (VPN, Meraki, etc)
- Connect the Domain to Azure Domain Servers
- Establish a Citrix Site


### Phase 2: Automated Citrix Cloud over Azure solution Delivery

With the domain connected and the Citrix Cloud Site setup, Entisys360 support staff will validate all environment settings and lastly trigger the second phase of the automated installation.

The customer will receive notice of the environment stand-up, access to key resources, and additional instructions and documentation.


## Step 1

Customer goes to Github location <link to be provided> which will be a public repository and click on the “Deploy to Azure” button.

Result: The Customer will be redirected to the Azure portal



## Step 2

Within the customer's Azure Portal, the ARM template form will be pre-populated with default data.
The customer will input custom values as per their requirements.

(future phase)
An estimate calculator which illustrates the estimated Azure consumption cost base on the data entered.

The customer will submit the form once he inputs all the required details.

Roles involved: Customer

Result: The form should validate the input values entered by the customer for basic requirements.



## Step 3

Description: ARM Phase one execution

The validated and submitted form will execute the preliminary bootstrap environment and resource automation.
- vnets and subnets
- Orchestrator VM
	Ansible Worker - Automation and Playbooks, Logging and Secret Management
- Domain Controllers
	2 Windows 2016 VMs which can be a Meraki or Azure gateway
- Citrix Cloud Connectors
	2 windows 2016 VMs
- A Basic vNet and subnet


If you have any quesitons or need assistance with these configuration steps, please contact Entisys360 support at 877-ENTISYS (877-368-4797) – Opt 9 or email support at support@entisys360.com.
