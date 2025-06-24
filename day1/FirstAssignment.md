# Exercise for Day 1: GCP Fundamentals: Compute, Storage & Networking

## Objective
Demonstrate understanding of core GCP services and create basic infrastructure using the GCP Console.

---

## Tasks Completed

### Task 0. Basic Setup
- Created a google cloud account using my email.
  ![account_created.png](screenshots/task0_basic_setup/account_created.png)
- Created a new project named `pi-shaped-workshop` in the Google Cloud Console.
  ![gcp_dashboard.png](screenshots/task0_basic_setup/gcp_dashboard.png)
- Installed the Google Cloud SDK on my local machine.
  ![gcloud_sdk_installed.png](screenshots/task0_basic_setup/gcloud_sdk_installed.png)

---

### Task 1. Create a VM using Compute Engine

- Enabled the Compute Engine API.
  ![compute_engine_api.png](screenshots/task1_vm_creation/compute_engine_api.png)
- Create Instance from Compute Engine Option
  ![vm_creation.png](screenshots/task1_vm_creation/create_instance.png)
- A VM named `demo-vm-linux` was created in region `us-central1-a`.
  ![vm_config_1.png](screenshots/task1_vm_creation/vm_config_1.png)
- Machine type: `E2`
  ![vm_config_2.png](screenshots/task1_vm_creation/vm_config_2.png)
- Firewall: Allow HTTP Traffic
  ![vm_config_3.png](screenshots/task1_vm_creation/vm_config_3.png)
- Check the vm is created
  ![new_created_vm.png](screenshots/task1_vm_creation/new_created_vm.png)

---

### Task 2. Create a Cloud Storage bucket and upload a file

- Created a bucket named `pi-shaped-demo-bucket`
  ![bucket_creation.png](screenshots/task2_bucket_creation/create_bucket.png)
- Check the bucket is created
  ![new_created_bucket.png](screenshots/task2_bucket_creation/new_created_bucket.png)
- Selected the upload Option from the newly created bucket
  ![upload_option_in_bucket.png](screenshots/task2_bucket_creation/upload_option_in_bucket.png)
- Selected the **blog*** file to upload
  ![file_selected_to_upload.png](screenshots/task2_bucket_creation/file_selected_to_upload.png)
- Check the file is uploaded
  ![uploaded_file.png](screenshots/task2_bucket_creation/uploaded_file.png)

---

### Task 3. Configure a VPC with custom subnets

- Created a custom VPC named `demo-vpc` 
  ![vpc_creation.png](screenshots/task3_vpc_creation/vpc_creation.png)
- Subnet `demo-subnet` configured in `us-central1` 
  ![subnet-creation.png](screenshots/task3_vpc_creation/subnet-creation.png)
- Entered the IP range: `10.0.0.0/24`
  ![vpc_ip_range.png](screenshots/task3_vpc_creation/vpc_ip_range.png)
- Check the vpc is created
  ![new_created_vpc.png](screenshots/task3_vpc_creation/new_created_vpc.png)

---

### Task 4. a. Connect to VM and Access File via Browser

- Go to the new created vm: `demo-vm-linux`
- Click "SSH" next to your VM. This opens a browser-based SSH terminal.
  ![ssh_via_browser.png](screenshots/task4a_access_file_via-browser/ssh_via_browser.png)
  ![ssh_via_browser_2.png](screenshots/task4a_access_file_via-browser/ssh_via_browser_2.png)
- Used `gsutil` to copy and read the file from Cloud Stora
```bash
  gsutil cp gs://pi-shaped-demo-bucket/blog .
  cat blog
 ```
![uploaded_file_access_via_browser.png](screenshots/task4a_access_file_via-browser/uploaded_file_access_via_browser.png)![upload

### Task 4. b. Connect to VM and Access File via Gcloud SDK

- Configured the SDK with my project:
  ```bash
  gcloud init
  ```
  ![gcloud_init.png](screenshots/task4b_access_file_via_gcloud_sdk/gcloud_init.png)
- Sign in to the gcloud when prompted
  ![signin_gcloud.png](screenshots/task4b_access_file_via_gcloud_sdk/signin_gcloud.png)
- Authorize via the browser
  ![signin_gcloud_2.png](screenshots/task4b_access_file_via_gcloud_sdk/signin_gcloud_2.png)
- Connected to the VM using `gcloud compute ssh`.
- Used `gsutil` to copy and read the file from Cloud Stora
```bash
  gsutil cp gs://pi-shaped-demo-bucket/blog .
  cat blog
 ```
 ![uploaded_file_access_via_gcloud_sdk.png](screenshots/task4b_access_file_via_gcloud_sdk/uploaded_file_access_via_gcloud_sdk.png)
  
### Task 5. Delete Resources

- Deleted the VM `demo-vm-linux` from Compute Engine.
  ![vm_deletion.png](screenshots/task5_resource_deletion/vm_deletion.png)
- Deleted the bucket `pi-shaped-demo-bucket` from Cloud Storage.
  ![bucket_deletion.png](screenshots/task5_resource_deletion/bucket_deletion.png)
- Deleted the VPC `demo-vpc` from VPC Network.
  ![vpc_deletion.png](screenshots/task5_resource_deletion/vpc_deletion.png)
- Checked the notification of deleted resources
  ![gcp_notifications.png](screenshots/task5_resource_deletion/gcp_notifications.png)

---
## Components interaction in a mini architecture

- The VM instance (demo-vm-linux) is deployed within the custom VPC (demo-vpc) and operates on the defined subnet (demo-subnet), enabling internal IP-based communication and isolation.
- By default, the VM is associated with a service account that has Cloud Storage read/write access, allowing it to interact with the Cloud Storage bucket without requiring additional credentials.
- The uploaded file in the Cloud Storage bucket can be accessed directly from the VM using the gsutil command-line tool.
- As the HTTP traffic is enabled in the VM’s firewall settings, the VM can serve content externally (e.g., web applications) over the internet, making it publicly accessible via its external IP.

---
## Core Concept Questions

### Why would a startup choose GCP over other providers for compute and storage?
A startup might choose GCP over other providers for compute and storage due to:
1. **Cost Efficiency**: Competitive pricing models like sustained-use discounts and preemptible VMs, ideal for startups with limited budgets.
2. **Scalability**: Seamless scaling of resources to support growth without infrastructure concerns.
3. **Global Network**: High-performance global network ensures low latency and high availability for a global audience.
4. **Integrated Services**: Tools like BigQuery, AI/ML, and Kubernetes Engine enable rapid innovation.
5. **Security**: Robust security features, including encryption by default and compliance with major standards.
6. **Ease of Use**: Intuitive console and tools like Cloud SDK simplify resource management.

### What are the advantages of using VPCs over default networking?
GCP regions and zones impact performance and availability in global apps by providing geographic distribution and redundancy. Regions are specific geographic locations, and zones are isolated locations within those regions. By deploying resources across multiple regions and zones, apps can achieve lower latency for users in different areas and maintain high availability during outages.

### How do GCP regions and zones impact performance and availability in global apps?
GCP regions and zones impact performance and availability in global apps by enabling geographic distribution and redundancy. Regions are specific geographic locations, while zones are isolated locations within those regions. Deploying resources across multiple regions and zones helps reduce latency for users in different areas and ensures high availability by mitigating the impact of outages in a single zone or region.

---