# Red Squad Inc. Azure Infrastructure

## Overview

This repository contains the Terraform configuration files used to deploy and manage the cloud infrastructure for Red Squad Inc. on Microsoft Azure. The infrastructure is designed to support a robust, secure, and scalable environment for our applications and services.

## Components

The following is a list of the primary components deployed within our Azure environment:

1. **Resource Group**: A container that holds related resources for an Azure solution.
2. **Virtual Network (VNet)**: The fundamental building block for your private network in Azure.
3. **Public IP**: An IP address that communicates with the internet, including Azure public-facing services.
4. **Load Balancer**: Helps distribute traffic to multiple servers to ensure no single server becomes overwhelmed, increasing reliability and availability.
5. **Windows Server VMs**: Virtual machines running the Windows Server operating system, serving as application hosts.
6. **Network Security Group (NSG)**: A set of firewall rules that allow or deny network traffic to resources connected to Azure VNets.
7. **VNet Peering**: Connects two VNets in the same or different Azure regions, allowing resources to communicate with each other.
8. **Ubuntu Server VM**: A virtual machine running the Ubuntu Server Linux distribution.
9. **DNS Record**: A record that maps a domain name to an IP address in the DNS system.

## Architecture

The architecture consists of two main VNets:

- **Front-end VNet**: Hosts the public-facing components such as the load balancer and the Windows Server VMs.
- **Back-end VNet**: Contains the internal services such as the Ubuntu Server VM.

The VNets are peered to enable secure internal communication. The load balancer ensures high availability of the services by distributing incoming traffic across the Windows Server VMs.

## Security

Network Security Groups are configured to restrict access as follows:

- Only RDP traffic is allowed to the Windows Server VMs from specific, whitelisted IP addresses.
- SSH access to the Ubuntu Server VM is restricted to internal traffic from the front-end VNet.

## Deployment

To deploy this infrastructure:

1. Clone the repository.
2. Navigate to the repository directory.
3. You must be in the directory of the file that you are wanting to run.
4. Use Terraform to initialize, plan, and apply the configuration:
   ```sh
   terraform init
   terraform plan
   terraform apply

## NOTE
 
 A note to make, when you are deploying the VM configuraton you must use the following command:
 ```sh
 terraform plan -var-file="../terraform.tfvars"
 terraform apply -var-file="../terraform.tfvars"

 
