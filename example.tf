provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-1"
}

resource "aws_instance" "another" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}

resource "aws_instance" "example" {
	ami						= "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
	depends_on = ["aws_s3_bucket.example"]     # explicit dependency

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"    # implicit dependency on aws_instance.example
}

resource "aws_s3_bucket" "example" {
  bucket = "gophers-test-terraform-getting-started-guide"
  acl    = "private"
}

output "ami" {
  value = "${lookup(var.amis, var.region)}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
