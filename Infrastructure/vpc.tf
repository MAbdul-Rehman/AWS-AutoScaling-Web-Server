provider "aws" {
    region = "us-east-1"
}

# VPC
resource "aws_vpc" "EC2VPC" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = false
    instance_tenancy = "default"
    tags = {
        Name = "Autoscaling-VPC"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "EC2InternetGateway" {
    tags = {
        Name = "Autoscaling-igw"
    }
    vpc_id = aws_vpc.EC2VPC.id
}

# Subnets
resource "aws_subnet" "EC2Subnet" {
    availability_zone = "us-east-1a"
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.EC2VPC.id
    map_public_ip_on_launch = true
}

resource "aws_subnet" "EC2Subnet2" {
    availability_zone = "us-east-1c"
    cidr_block = "10.0.3.0/24"
    vpc_id = aws_vpc.EC2VPC.id
    map_public_ip_on_launch = true
}

resource "aws_subnet" "EC2Subnet3" {
    availability_zone = "us-east-1e"
    cidr_block = "10.0.5.0/24"
    vpc_id = aws_vpc.EC2VPC.id
    map_public_ip_on_launch = true
}

# Route Table
resource "aws_route_table" "EC2RouteTable" {
    vpc_id = aws_vpc.EC2VPC.id
    tags = {
        Name = "Autoscaling-Public-rtable"
    }
}

resource "aws_route" "EC2Route" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.EC2InternetGateway.id
    route_table_id = aws_route_table.EC2RouteTable.id
}
