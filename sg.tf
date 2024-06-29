resource "aws_security_group" "sg1" {
    name = "terraform_sg"
    description = "Allow ssh and httpd"
    
  
    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
       #cidr_blocks = ["0.0.0.0/0"]
       security_groups = [  aws_security_group.sg2.name]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
    created-by-terraform = "yes"
  }
}
resource "aws_security_group" "sg2" {
    name = "terraform_sg_lb"
    description = "Allow ssh and httpd"
    
  
    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
  } 
}