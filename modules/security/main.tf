resource "aws_security_group" "private_subnet_instances_sg" {
  ingress {
    from_port       = var.ingress_port
    to_port         = var.ingress_port
    protocol        = var.ingress_protocol
    security_groups = [aws_security_group.private_subnet_lb_sg.id]
  }

  egress {
    from_port       = var.egress_port
    to_port         = var.egress_port
    protocol        = var.egress_protocol
    security_groups = [aws_security_group.private_subnet_lb_sg.id]
  }

  vpc_id = var.vpc_id
}

resource "aws_security_group" "private_subnet_lb_sg" {
  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.lb_sg_cidrs
  }

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = var.lb_sg_cidrs
  }

  vpc_id = var.vpc_id
}

resource "aws_iam_role" "ssm_role" {
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": {
      "Effect": "Allow",
      "Principal": {"Service": "ec2.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }
  }
EOF
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  role = aws_iam_role.ssm_role.name
}