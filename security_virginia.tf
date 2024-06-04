provider "aws" {
   region = "us-east-1"
   access_key = ""
   secret_key = ""
 }
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = ""
}
