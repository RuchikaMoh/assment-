# Define AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket for static website hosting
resource "aws_s3_bucket" "website" {
  bucket = "my-static-website-bucket"
  website {
    index_document = "index.html"
  }
}

# Create an EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
}

output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.website.bucket
}
