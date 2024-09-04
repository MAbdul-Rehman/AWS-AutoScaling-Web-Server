# Load Balancer
resource "aws_lb" "ElasticLoadBalancingV2LoadBalancer" {
    name = "Autoscaling-ALB"
    internal = false
    load_balancer_type = "application"
    subnets = [
        aws_subnet.EC2Subnet.id,
        aws_subnet.EC2Subnet2.id,
        aws_subnet.EC2Subnet3.id
    ]
    security_groups = [aws_security_group.EC2SecurityGroup.id]
    ip_address_type = "ipv4"
    enable_http2 = true
}

# Target Group
resource "aws_lb_target_group" "ElasticLoadBalancingV2TargetGroup" {
    health_check {
        interval = 30
        path     = "/"
        protocol = "HTTP"
    }
    port       = 80
    protocol   = "HTTP"
    vpc_id     = aws_vpc.EC2VPC.id
}

# Listener
resource "aws_lb_listener" "ElasticLoadBalancingV2Listener" {
    load_balancer_arn = aws_lb.ElasticLoadBalancingV2LoadBalancer.arn
    port              = 80
    protocol          = "HTTP"
    default_action {
        target_group_arn = aws_lb_target_group.ElasticLoadBalancingV2TargetGroup.arn
        type             = "forward"
    }
}
