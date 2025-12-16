module "alb" {
  source = "./alb"
  
  name  = "my-alb2"
  security_group = ["sg-08d64a6a4e1a252bd"]
  subnets  = [
    "subnet-0bd2a6db82585a589", 
    "subnet-0e40e13af310eb0f0"
    ]
  vpc_id = "vpc-08d274b7fc12560a9"
}