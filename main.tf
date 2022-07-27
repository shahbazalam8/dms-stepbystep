terraform {
  backend "s3" {}
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_cloudformation_stack" "dms-stack" {
  name = "dms-cf-stack-2"

  template_url = "https://dmsdeploy-code.s3.amazonaws.com/dms_launch.json"
    
  parameters = {
    AdminEmail       = "shahbaz.alam@synectiks.com"
    AppEnvironment   = "stage"
    EnablePublicUrls = "true"
  }
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_AUTO_EXPAND", "CAPABILITY_NAMED_IAM"]
}