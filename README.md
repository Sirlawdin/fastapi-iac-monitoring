# **EKS Datadog Tracing**

## **Overview**
This project sets up an **Amazon EKS (Elastic Kubernetes Service) cluster** with **Datadog tracing** for monitoring FastAPI microservices. It includes:
- **Terraform infrastructure** to provision an EKS cluster and networking (VPC, subnets).
- A **FastAPI application** containerized with **Docker**, integrated with **Datadog APM** for tracing.
- Automated **monitoring and logging** through Datadog.

---

## **Project Structure**
```
eks-datadog-tracing/
│── main.tf                # Main Terraform configuration
│── variables.tf           # Terraform variables
│── outputs.tf             # Terraform outputs
│── providers.tf           # Terraform providers setup
│── terraform.tfvars       # Variables values
│── .terraform.lock.hcl    # Terraform lock file
│
├── app/
│   ├── Dockerfile         # Docker configuration for the application
│   ├── main.py           # Application source code
│   ├── requirements.txt   # Dependencies for the application
│
└── modules/
    ├── eks/
    │   ├── outputs.tf     # Module-specific Terraform outputs
    │   ├── other files... # Additional module-specific Terraform files
```

---

## **Prerequisites**
Ensure you have the following installed:
- **Terraform** (>= 1.0.0)
- **AWS CLI** (configured with appropriate IAM permissions)
- **kubectl** (to interact with EKS)
- **Docker** (for containerized deployment)
- **Datadog API Key** (for monitoring)

---

## **Installation and Deployment**
### **1. Clone the Repository**
```sh
git clone https://github.com/your-repo/eks-datadog-tracing.git
cd eks-datadog-tracing
```

### **2. Configure Terraform Variables**
Edit `terraform.tfvars` with your AWS and EKS configuration.

Example:
```hcl
aws_region        = "us-east-1"
vpc_name         = "eks-vpc"
k8s_name         = "my-cluster"
datadog_api_key  = "your-datadog-api-key"
```

### **3. Initialize and Apply Terraform**
```sh
terraform init
terraform apply -auto-approve
```
This will create the EKS cluster and related infrastructure.

### **4. Deploy the FastAPI Application**
#### **Build and Push Docker Image**
```sh
cd app/
docker build -t your-docker-repo/eks-app:latest .
docker push your-docker-repo/eks-app:latest
```
#### **Deploy to Kubernetes**
Ensure `kubectl` is configured:
```sh
aws eks update-kubeconfig --region us-east-1 --name my-cluster
```
Deploy the application:
```sh
kubectl apply -f k8s/deployment.yaml
```

---

## **Endpoints**
The FastAPI application exposes the following endpoints:
- `/` → **Hello World**
- `/slow` → **Fixed 2-second delay**
- `/random-delay` → **Random delay between 0.5 - 3 seconds**

Use:
```sh
curl http://your-app-url/
```

---

## **Datadog Integration**
1. Log in to [Datadog](https://www.datadoghq.com/).
2. Navigate to **APM > Services** to view traces.
3. Ensure your `DATADOG_API_KEY` is correctly configured.

---

## **Destroying the Infrastructure**
To tear down the cluster:
```sh
terraform destroy -auto-approve
```

---

## **Contributing**
- Open an issue for any feature requests or bugs.
- Fork the repository and submit a PR for improvements.

---

## **License**
This project is licensed under the MIT License.
