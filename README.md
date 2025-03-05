# eks-datadog-tracing

## Directory Structure

```plaintext
eks-datadog-tracing/
├── modules/
│   ├── eks/
│   │   ├── main.tf        # Manages EKS Cluster & Helm provider
│   │   ├── variables.tf   # Defines EKS variables
│   │   ├── outputs.tf     # Outputs EKS details
│   ├── datadog/
│   │   ├── main.tf        # Manages Datadog agent, logs, tracing, alerts
│   │   ├── variables.tf   # Defines Datadog API keys & settings
│   ├── application/
│   │   ├── main.tf        # Defines deployment of FastAPI app in EKS
│   │   ├── variables.tf   # Defines application variables
│   ├── vpc/
│   │   ├── main.tf        # Manages VPC networking
│   │   ├── variables.tf   # Defines VPC settings
│   │   ├── outputs.tf     # Outputs VPC details
├── main.tf                # Calls modules (eks, datadog, application, vpc)
├── providers.tf           # Defines Terraform providers (AWS, Helm, Datadog)
├── variables.tf           # Global Terraform variables
├── outputs.tf             # Outputs important data (e.g., EKS cluster info)
