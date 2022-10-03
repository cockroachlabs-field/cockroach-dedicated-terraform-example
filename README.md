# cockroach-dedicated-terraform-example

This is an example of how to provision a Cockroach Cloud Dedicated Cluster using the newly releases provider, provision an EKS Cluster and allow connectivity between the two.

This repository creates the following resources:
* 1 EKS Cluster with a CIDR of 10.0.0.0/16
* 1 CRDB Cluster

PreRequisites:
* Git CLI
* Terraform
* Cockroach Cloud API Key

Instructions:

1. Clone this repository
```https://github.com/mbookham7/cockroach-dedicated-terraform-example.git```
2. Using the terraform.tfvars.example file, create a terraform.tfvars file with the variables that you'd like to use
3. Export your Cockroach API Key
```export COCKROACH_API_KEY=<YOUR_API_KEY>```
4. Initialise the Terraform code
```terraform init```
5. Run Terraform plan and validate it's creating the correct resources
```Terraform plan```
6. Once happy, apply the terraform
```terraform apply -auto-approve```