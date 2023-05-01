# Internet Gateway - To recive Internet Traffic
resource "aws_internet_gateway" "aws_internet_gateway_igw" {
  vpc_id     = aws_vpc.aws_vpc_alpha.id

  tags = {
    Name = "aws_internet_gateway_igw"
  }
}

# Public Route Table to get associated with Public Subnets
resource "aws_route_table" "aws_route_table_public" {
  vpc_id     = aws_vpc.aws_vpc_alpha.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_internet_gateway_igw.id
  }

  #route {
    #ipv6_cidr_block        = "::/0"
    #egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  #}

  tags = {
    Name = "aws_route_table_public"
  }
}


# NAT GATEWAY to Recieve traffic from Internet Gateway and forward to NAT which allows internet traffic to Private Resources
resource "aws_nat_gateway" "aws_nat_gateway_nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.aws_subnet_zonea_public_alpha.id
}


# Public Route Table to get associated with Public Subnets
resource "aws_route_table" "aws_route_table_private" {
  vpc_id     = aws_vpc.aws_vpc_alpha.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.aws_nat_gateway_nat.id
  }

  #route {
    #ipv6_cidr_block        = "::/0"
    #egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  #}

  tags = {
    Name = "aws_route_table_private"
  }
}


#Zone A public subnet gets associated with Public Route Table
#resource "aws_main_route_table_association" "zonea_public_subnet_association" {
 # vpc_id     = aws_vpc.aws_vpc_alpha.id
  #route_table_id = aws_route_table.aws_route_table_public.id
#}

#Zone A public subnet gets associated with Public Route Table
resource "aws_route_table_association" "zonea_public_subnet_association" {
  subnet_id      = aws_subnet.aws_subnet_zonea_public_alpha.id
  route_table_id = aws_route_table.aws_route_table_public.id
}

#Zone A private subnet gets associated with Private Route Table
resource "aws_route_table_association" "zonea_private_subnet_association" {
  subnet_id = aws_subnet.aws_subnet_zonea_private_alpha.id
  route_table_id = aws_route_table.aws_route_table_private.id
}

#Zone B public subnet gets associated with Public Route Table
resource "aws_route_table_association" "zoneb_public_subnet_association" {
  subnet_id = aws_subnet.aws_subnet_zoneb_public_alpha.id
  route_table_id = aws_route_table.aws_route_table_public.id
}

#Zone A private subnet gets associated with Private Route Table
resource "aws_route_table_association" "zoneb_private_subnet_association" {
  subnet_id = aws_subnet.aws_subnet_zoneb_private_alpha.id
  route_table_id = aws_route_table.aws_route_table_private.id
}