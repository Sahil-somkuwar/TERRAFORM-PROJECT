provider "aws" {
    region = "eu-north-1"
  
}
module "s3" {
    source = "./s3"
    
    Name = "my_bucket_new"
    Environment =  "dev"
    status = "Enabled"
}