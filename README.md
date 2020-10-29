# Entisys360 Azure Marketplace MVP!

![Azure Public Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/PublicLastTestDate.svg)
![Azure Public Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/PublicDeployment.svg)

![Azure US Gov Last Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/FairfaxLastTestDate.svg)
![Azure US Gov Last Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/FairfaxDeployment.svg)

![Best Practice Check](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/BestPracticeResult.svg)
![Cred Scan Check](https://azurequickstartsservice.blob.core.windows.net/badges/100-marketplace-sample/CredScanResult.svg)

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fentisys360%2FARM-Template-Sample%2Fvinay-dev%2Fmaindeploy.json%3Ftoken%3DAOLIENSE6EP5CNADGJJY2WC7SZ6MK)


## Introduction 
<p align="justify">
To ease the manual delivery of computing of Citrix cloud over Azure solutions, Entisys360 has created a solution which streamlines End User Computing by automating the Citrix cloud over Azure delivery solution. The end product will leverage the Azure market place. For the first phase the Minimum Viable Product will be released with from Github repositories.


## The following steps outlines the features that will be released as part of the first phase (Beta release). 

 

------------------------------------------------------------
### **Step 1**
------------------------------------------------------------
**Description :** Click on the Github Button. 

**Action:**

1. Customer goes to Github location [Entisys360-Citrix](https://github.com/entisys360/Entisys360-CitrixWVD/) which will be a public repository 
2. She clicks on the “Entisys360 WVD Delivery” button in Github. 

**Roles involved:** Customer 

**Output:** The Customer will be redirected to the Azure portal 

------------------------------------------------------------
### **Step 2**
------------------------------------------------------------
**Description:** Azure portal ARM template 

**Action:** 

1. Customer will be presented a pre-populated ARM form where she will need to input the required values. 

2. The form will be provided with default values which can be overwritten by the customer if required. 

3. The form will be a paginated with appropriate sections for collecting the inputs from the customer 

4. An cost calculator which estimates the cost will be displayed before the submission. The details will include: 

    1. Azure Consumption cost 

    2. Citrix License 

5. The customer will submit the form once she inputs all the required details. 

**Roles involved:** Customer 

**Output:** 

1. The form should validate the input values 

2. The form once submitted will execute the next steps in 2 phases 

 
------------------------------------------------------------
### **Step 3** 
------------------------------------------------------------
**Description :**: ARM Phase one execution 

**Action:**  

1. The initial bootstrap execution starts 
2. This will start the the initial setup using a VM extension. This involves setting up of the vnets, subnets, VMs for domain controllers and cloud connectors. 

3. This will also set up an additional VM as an Orchestrator VM which includes:  

    1. The Controller/ worker node which will be used to host the Ansible to run the required playbooks  

    2. A storage account for the data input from the ARM template form to be used for the ARM phase two execution. 

4. This is referred to as the Ansible controller.  

5. This Ansible controller performs the task of downloading the source code from the repositories to install the required tools in the controller VM which will be used to     execute phase 2. 
6. The ARM input  values will be converted to a Ansible readable Json format and dumped in the Ansible Orchestrator VM.
6. An email should be sent for the manual intervention for both customer and Entisys360 C+A product DL 

**Roles involved:**  Automated step 

**Output:**  

1. Post the first phase execution following should be available. 

    1. A Basic vNet and subnet 

    2. 2 Windows 2016 VMs for Domain controllers which can be a Meraki or Azure gateway. 

    3. 2 windows 2016 VMs for cloud connectors 

    4. 1 VM which will act as the Controller(Orchestrator) also referred to as Ansible worker node 

2. The VM controller which acts as a bootstrapper will perform the following 

    1. Store the data input from the ARM template form to be used in the second phase of the execution 

    2. The Packer binary should be installed as part of Ansible worker node installation 
  

3. The customer and the E360 C+A product DL will receive an email to complete the desired procurements and licensing. 
------------------------------------------------------------
### **Step 4**
------------------------------------------------------------
**Description:** Manual steps

**Action:**
1. Customer on receiving the email will complete the desired procurements and licensing.
2. Once completed the Customer along with the E360 will complete the Domain join operations which involves
	1. Join/Provide the network , Meraki , Azure gateway and complete the VPN details.
	2. Configure the domain controllers by joining the customer domain
3. Once completed E360 will take on the next step to complete the ARM phase two form.
4. Customer should create a managed identity and attach it to the Subscription.

**Roles involved:** Customer, E360 C+A product DL

**Output:**
1. The customer should complete all the procurements and licensing successfully
1. The E360 product DL will collaborate with the customer to complete the Domain join operations.
1. The E360 will be ready to complete the second (private) ARM Template “Entisys360 WVD Delivery (step 2)”.
1. A maanged identity should be attached manaully so it can be used for the direct authorisation.

------------------------------------------------------------
### **Step 5**
------------------------------------------------------------
**Description:** ARM template form Entisys360 WVD Delivery (step 2) - Manual step

**Action:**
1. Once the manual steps are completed the E360 representative will click on the second ARM template which is a private template.
1. The E60 representative will be redirected to the Azure portal where he will be visualizing a	ARM template form with pre populated values stored in the Orchestrator VM
1. Any updates like network details and subnet details are completed by E360 before he submits the form.
1. Once submitted the second phase of the ARM template execution kicks off.

**Roles involved:**  E360 C+A product DL

**Output:**
1. The E360 product DL should be able to view the pre-populated form and update accordingly 	   before submitting it.
2. The network and subnet details required is E360 managed and driven.
------------------------------------------------------------
### **Step 6**
------------------------------------------------------------
**Description:** ARM template form execution (step 2)

**Action:**
1. Once the E360 representative submits the form it triggers the build.
2. The Submission will convert the values and submit it to the Ansible host controller.
3. The Ansible host controller will be responsible to configure the local resources from the repos

**Roles involved:** System, Ansible host controller

**Output:**
1. The build should trigger successfully.
1. The Ansible host controller should be able to trigger the binaries as required based on the tag.
1. The tags will be retrieved with the help of dynamic inventory mapping.

------------------------------------------------------------ 
### **Step 7**
------------------------------------------------------------
**Description:** Ansible host controller jobs- Image bakery

**Action:**
1. The Ansible controller will then initiate the packer binary to run the image bakery
1. Packer will create a VM  
1. The Ansible host controller will then run the playbook to install the required software and policies as per Entisys policies
1. It will then take a snap shot and create a VDI image in the Azure market gallery
**Roles involved:**  Ansible host controller.,Packer binary

**Output:**
1. The Ansible host controller should be able to use the packer binaries to kick off the image bakery process.
1. The VDI image snap shot that will can be used by Machine catalog in Citrix environment should be available in the market gallery. 
------------------------------------------------------------
### **Step 8**
------------------------------------------------------------
**Description:** Citrix Components

**Action:**
1. The Ansible controller will first install the cloud connector software on the dedicated cloud connector VMs.
1. It will then run the playbook to perform a hosting connection to connect the Citrix cloud to the Azure cloud
1. Once done it will register the cloud connectors VMs to the Citrix environment.
1. Post registration it will use the baked image of VDI from the Step 8 to create a machine	catalog in the Citrix environment.
1. A delivery group will be created based on the machine catalog created.
**Roles involved:**  Ansible host controller, playbooks

**Output:**
1. The Ansible host controller should be able to run the playbooks to execute the power DSC scripts written to install Citrix components in the Citrix cloud.
1. The details of installed Citrix components are as below
    1. The service principle will be driven and managed by E360 
    1. It will be a multi session
    1. Currently only one VDI will be launched with option to add more later
    1. *Need dictated values and user specific values to be listed out.*
 </p>
