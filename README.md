# cockroach-dedicated-terraform-example

This is an example of how to provision a Cockroach Cloud Dedicated Cluster using the newly releases provider, provision an EKS Cluster and allow connectivity between the two.

This repository creates the following resources:
* 1 EKS Cluster with a CIDR of 10.0.0.0/16
* 1 CRDD Cluster

PreRequisites:
* Git CLI
* Terraform
* Cockroach Cloud API Key

Instructions:

```1. Clone the repository```