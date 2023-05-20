# Create Instances in GCP with Terraform 

```bash
path          = "./file.json"
project       = "djelajah"
region        = "us-central1"
zone          = "us-central1-f"
os_image      = "ubuntu-os-cloud/ubuntu-2204-lts-arm64"
gcp_vm_type   = "t2a-standard-1"
gcp_vm_name   = "terraform"
disk_size     = 30
ssh_key       = ""
ssh_user      = "ubuntu"
ip_cidr_range = "10.130.0.0/20"
```

# Find zone list

```bash
$ gcloud compute zones list
```

# Find OS list

```bash
$ gcloud compute images list
$ gcloud beta compute images list
```

# Find machine type

```bash
$ gcloud compute machine-types list --zones=asia-southeast1-b
```
