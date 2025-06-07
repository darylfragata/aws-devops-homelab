# Multi-Account AWS Infrastructure as Code

This repository contains Terraform configurations for managing a multi-account AWS infrastructure setup. The project follows a modular approach with environment-specific configurations and reusable modules.

## Repository Structure

```
├── environment/                    # Environment-specific configurations
│   ├── dev/                       # Development Account
│   ├── qa/                        # QA Account - not configured on this sample
│   ├── prod/                      # Production Account - not configured on this sample
│   ├── network/                   # Shared Network Account - not configured on this sample
│   └── security/                  # Security Account - not configured on this sample
│
└── modules/                       # Reusable Terraform Modules
    ├── networking/               # Network infrastructure modules
    ├── compute/                  # Compute resource modules
    ├── security/                 # Security configuration modules
    └── s3/                       # Storage configuration modules
```