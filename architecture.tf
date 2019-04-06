provider "aws" {
  region = "${var.aws-region}"
}

# Define our VPC
resource "aws_vpc" "minus-et-cortex-vpc" {
  cidr_block           = "${var.vpc-cidr}"
  enable_dns_hostnames = true

  tags {
    Name    = "VPC"
    Project = "Minus et cortex"
  }
}

# Define the public subnet
resource "aws_subnet" "minus-et-cortex-public-subnet" {
  vpc_id            = "${aws_vpc.minus-et-cortex-vpc.id}"
  cidr_block        = "${var.public-subnet-cidr}"
  availability_zone = "${var.aws-availability-zone-1}"

  tags {
    Name    = "Public Subnet"
    Project = "Minus et cortex"
  }
}

# Define the private subnet
resource "aws_subnet" "minus-et-cortex-private-subnet" {
  vpc_id            = "${aws_vpc.minus-et-cortex-vpc.id}"
  cidr_block        = "${var.private-subnet-cidr}"
  availability_zone = "${var.aws-availability-zone-2}"

  tags {
    Name    = "Private Subnet"
    Project = "Minus et cortex"
  }
}

# Define the internet gateway
resource "aws_internet_gateway" "minus-et-cortex-internet-gateway" {
  vpc_id = "${aws_vpc.minus-et-cortex-vpc.id}"

  tags {
    Name    = "VPC Internet Gateway"
    Project = "Minus et cortex"
  }
}

# Define the route table
resource "aws_route_table" "minus-et-cortex-public-route-table" {
  vpc_id = "${aws_vpc.minus-et-cortex-vpc.id}"

  route {
    cidr_block = "${var.public-rt-cidr}"
    gateway_id = "${aws_internet_gateway.minus-et-cortex-internet-gateway.id}"
  }

  tags {
    Name    = "Public Subnet Route Table"
    Project = "Minus et cortex"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "minus-et-cortex-public-route-table-association" {
  subnet_id      = "${aws_subnet.minus-et-cortex-public-subnet.id}"
  route_table_id = "${aws_route_table.minus-et-cortex-public-route-table.id}"
}
