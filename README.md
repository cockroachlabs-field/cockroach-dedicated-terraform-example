# cockroach-dedicated-terraform-example

This is an example of how to provision a Cockroach Cloud Dedicated Cluster using the newly releases provider, provision an EKS Cluster leveraging the EKS module and allow connectivity between the two.

This repository creates the following resources:
* 1 EKS Cluster with a CIDR of 10.0.0.0/16
* 1 CRDB Cluster

PreRequisites:
* Git CLI
* Terraform
* AWS CLI (For KubeConfig Auth)
* Kubectl
* Cockroach Cloud API Key

Deployment Instructions:

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

Network Connectivity Testing

1. Retrieve the CRDB Connection string and the DB Console URL from the Cockroach Cloud UI for your newly created cluster. (Currently the provider does not output the connection string)

2. Set up Kubectl to use the generated Kubeconfig file.

```cd modules/aws_infra/```
```export KUBECONFIG=kubeconfig```

3. Validate connection to the Kubernetes cluster

```kubectl get pods --all-namespaces```

4. Test the network connectivity to both the UI and the DB using a pod

```kubectl run -it network-test-1--image=alpine/curl:3.14 --restart=Never -- curl -vk dsmbcrdbtftexample-6q9.aws-eu-west-2.cockroachlabs.cloud:26257```

```kubectl run -it network-test-2 --image=alpine/curl:3.14 --restart=Never -- curl -vk admin-dsmbcrdbtftexample-6q9.cockroachlabs.cloud:8080/health```