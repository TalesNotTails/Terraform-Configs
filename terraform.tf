terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  } 
   backend "s3" {
    shared_credentials_files = ["~/.aws/credentials"]
    shared_config_files = ["~/.aws/config"]
    profile = "terraform"
    bucket = "tf-rb-cs"
    key = "state/terraform.state"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
} 
