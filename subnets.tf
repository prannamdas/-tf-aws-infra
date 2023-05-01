#ZoneA - ZoneA-Public Subnet || ZoneA-Private Subnet
resource "aws_subnet" "aws_subnet_zonea_public_alpha" {
  vpc_id     = aws_vpc.aws_vpc_alpha.id
  cidr_block = "10.0.1.0/24"
  availability_zone="us-east-2a"
  tags = {
    Name = "aws_subnet_zonea_public_alpha"
  }
}

resource "aws_subnet" "aws_subnet_zonea_private_alpha" {
  vpc_id     = aws_vpc.aws_vpc_alpha.id
  cidr_block = "10.0.2.0/24"
  availability_zone="us-east-2a"
  tags = {
    Name = "aws_subnet_zonea_private_alpha"
  }
}


#ZoneB - ZoneB-Public Subnet || ZoneB-Private Subnet
resource "aws_subnet" "aws_subnet_zoneb_public_alpha" {
  vpc_id     = aws_vpc.aws_vpc_alpha.id
  cidr_block = "10.0.3.0/24"
  availability_zone="us-east-2b"
  tags = {
    Name = "aws_subnet_zoneb_public_alpha"
  }
}

resource "aws_subnet" "aws_subnet_zoneb_private_alpha" {
  vpc_id     = aws_vpc.aws_vpc_alpha.id
  cidr_block = "10.0.4.0/24"
  availability_zone="us-east-2b"
  tags = {
    Name = "aws_subnet_zoneb_private_alpha"
  }
}
