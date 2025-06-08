# AWS DevOps Homelab Infrastructure with Terraform

This Terraform project automates the provisioning of my AWS homelab environment, covering core components such as VPC, IAM roles, security groups, S3 buckets, and EC2 virtual machines.

## Background

I built this project as part of my homelab to sharpen my **AWS DevOps skills** using **Terraform** and **GitHub Actions**. Since I use **A Cloud Guru's playground** which limits sessions to 8 hours and deletes resources after expiry, this setup helps me quickly rebuild my entire infrastructure when needed.

Currently, this setup targets a **single AWS account** but is designed with modularity and environment segregation to enable **multi-account expansion** in the future.


## What It Creates

* **VPC** with subnetting and routing
* **IAM Roles and Policies** scoped for different application components
* **Security Groups** for controlling network access
* **S3 Buckets** for storage and Terraform state backend
* **EC2 Instances** as virtual machines for various workloads
* Modular Terraform code for easier management and reuse


## Repository Structure

```
aws-devops-homelab/
├── README.md
├── environments/
│   └── dev/
│       ├── iam/                  # IAM roles and policies for dev environment
│       ├── s3/                   # S3 buckets and backend configs
│       ├── security_groups/      # Security group configs
│       ├── vm/                   # Virtual machine (EC2) configs
│       └── vpc/                  # VPC and networking configs
└── modules/
    ├── ec2/                     # Reusable EC2 module
    ├── iam/                     # Reusable IAM roles/policies module
    ├── s3/                      # Reusable S3 bucket module
    ├── security_groups/         # Reusable security group module
    └── vpc/                     # Reusable VPC module
```


## Automation with GitHub Actions Workflows

All Terraform provisioning steps in this project are **fully automated** via **GitHub Actions workflows**. The workflows are triggered on pushes to the main branch and run on a **self-hosted GitHub runner**. They orchestrate the deployment in stages, including:

* Initializing Terraform
* Planning changes and saving plan artifacts
* Applying the approved plan for each infrastructure component in sequence (VPC → Security Groups → IAM → VM)

This ensures **consistent, repeatable, and auditable deployments** without manual intervention, enabling true Infrastructure-as-Code CI/CD.


## Usage (Local Terraform CLI)

If you prefer running Terraform manually for testing or development, you can:

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/aws-devops-homelab.git
   cd aws-devops-homelab/environments/dev
   ```

2. Review and update variables in `terraform.tfvars` and other `.tf` files as needed.

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Validate and apply the infrastructure:

   ```bash
   terraform plan
   terraform apply
   ```


## Notes

* This repo currently targets a **single AWS account** deployment.
* The structure is modular and organized to **support multi-account architectures** with minimal changes.
* Backend configurations (`backend.tf`) use S3 and DynamoDB (where applicable) to securely manage Terraform state.
* Customize each environment under `environments/` for dev, qa, prod, etc.
* Expand and reuse modules in `modules/` for consistent resource creation.
* Ensure your AWS credentials are configured on your local machine or securely via GitHub Secrets when using workflows.


## Contribution

Contributions are welcome! Feel free to open issues or submit pull requests to improve modules, add new environments, or enhance documentation.

## Acknowledgments
This README file was generated with the assistance of AI tools to help streamline the documentation process.
