resource "aws_instance" "bilal-ec2-ubuntu" {
  ami                         = "ami-047126e50991d067b"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0f09f6c0daaf1fe2f" # Subnet ID for EC2 instance
  key_name                    = "bilal ec2 key"
  vpc_security_group_ids      = [aws_security_group.my-sg.id] # Assign EC2 security group
  associate_public_ip_address = true
  #ADD role name
  iam_instance_profile = "bilal-s3-ec2"

  tags = {
    Name = "bilal-ec2-ubuntu"
  }
  
  user_data = base64encode(file("${path.module}/userdata/website.sh"))  # Importing user data from file


    // if we do not mention our ec2 instance will still be created with default instance.
    // 
  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

}

  resource "aws_instance" "bilal-ec2-amazon" {
    ami                         = "ami-0f935a2ecd3a7bd5c" # Amazon Linux 2023 AMI ID
    instance_type               = "t2.micro"
    subnet_id                   = "subnet-0f09f6c0daaf1fe2f" # Subnet ID for EC2 instance
    key_name                    = "bilal ec2 key"
    vpc_security_group_ids      = [aws_security_group.my-sg.id] # Assign EC2 security group
    associate_public_ip_address = true
    #ADD role name
    iam_instance_profile = "bilal-s3-ec2"

    tags = {
      Name = "bilal-ec2-amazon"
    }
    
    user_data = base64encode(file("${path.module}/userdata/website-amazon.sh"))  # Importing user data from file


      // if we do not mention our ec2 instance will still be created with default instance.
      // 
    root_block_device {
      volume_size = 30
      volume_type = "gp3"
    }

  }

