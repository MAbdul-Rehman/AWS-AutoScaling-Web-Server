# CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "CloudWatchAlarm" {
    alarm_name          = "HighCPUAlarm"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = 300
    statistic           = "Average"
    threshold           = 70
    alarm_actions       = [aws_autoscaling_policy.AutoScalingScalingPolicy.arn]
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.AutoScalingAutoScalingGroup.name
    }
}
