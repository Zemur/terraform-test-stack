variable "instance_name" {
  description 	= "Value of the Name tag for the EC2 instance."
  type		= string
  default	= "ExampleAppServerInstance"
}

variable "aws_profile" {
  description	= "AWS profile to use."
  type		= string
  default	= "default"
}

variable "aws_region" {
  description	= "AWS Region to use."
  type		= string
  default	= "us-west-2"
}

variable "ami_id" {
  description	= "AMI ID for EC2 instance."
  type		= string
  default	= "ami-08d70e59c07c61a3a"
}

variable "instance_type" {
  description	= "EC2 instance type."
  type		= string
  default 	= "t2.micro"
}
