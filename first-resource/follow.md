# Initialize the terraform file 
Terraform init

# Check plan
Terraform plan

# Apply changes and write yes
Terraform apply

# Update the main.tf file to change the permission
resource "local_file" "games" {
  filename     = "/<your-file-path>/first-resource/favorite-games.txt"
  content  = "FIFA 21"
  file_permission = "0700"
}

# Initialize the file
Terraform init

# Check plan and apply
Terraform plan
Terraform apply