# Terraform Azure Virtual Machine

## Project Overview

This project demonstrates how to create an Azure Linux Virtual Machine (VM) using Terraform simple code.

The infrastructure includes all required networking resources such as Resource Group, Virtual Network, Subnet, and Network Interface Card (NIC), followed by VM deployment.

---

## Architecture

Resource flow:

Resource Group → Virtual Network → Subnet → Network Interface (NIC) → Virtual Machine

---

## Resources Created

* Azure Resource Group
* Azure Virtual Network (VNet)
* Azure Subnet
* Azure Network Interface (NIC)
* Azure Linux Virtual Machine

---

## Prerequisites

Before running this project, ensure the following tools are installed:

* Azure Subscription
* Terraform
* Azure CLI
* Visual Studio Code (optional)

Login to Azure:

```bash
az login
```

---

## Project Structure

```text
06-terraform-azure-virtual-machine/
│
├── provider.tf
├── main.tf
├── .gitignore
├── README.md

```

---

## Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Generate execution plan:

```bash
terraform plan
```

Deploy resources:

```bash
terraform apply
```

---

## Outputs

This project provides:

* Resource Group Name
* Virtual Network Name
* Subnet Name
* Network Interface Name
* Virtual Machine Name

---

## Learning Objectives

Through this project I learned:

* Infrastructure as Code (IaC)
* Terraform resource dependencies
* Azure Virtual Machine deployment
* Azure networking concepts
* NIC attachment with VM
* Terraform workflow

---

## Future Enhancements

* Add Network Security Group (NSG)
* Add Public IP
* Configure Azure Bastion
* Use Terraform Modules
* Implement Remote Backend
* Add CI/CD pipeline with GitHub Actions

---

## Author

Ranjeet Kumar
DevOps | Azure | Terraform | Kubernetes
