# Launch Template
resource "aws_launch_template" "EC2LaunchTemplate" {
    name = "Autoscaling_temp"
    key_name = "vockey"
    image_id = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    user_data = base64encode("#!/bin/bash\nyum install -y httpd\nsystemctl start httpd\nsystemctl enable httpd\necho '<h1>Welcome to Auto-scaling Web Server</h1>' > /var/www/html/index.html")
    vpc_security_group_ids = [aws_security_group.EC2SecurityGroup.id]
}

# Auto Scaling Group
resource "aws_autoscaling_group" "AutoScalingAutoScalingGroup" {
    name               = "Auto Scaling"
    max_size           = 3
    min_size           = 1
    desired_capacity   = 1
    launch_template {
        id      = aws_launch_template.EC2LaunchTemplate.id
        version = "$Latest"
    }
    target_group_arns  = [aws_lb_target_group.ElasticLoadBalancingV2TargetGroup.arn]
    availability_zones = ["us-east-1a", "us-east-1c", "us-east-1e"]
   
}

