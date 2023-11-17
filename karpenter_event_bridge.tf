resource "aws_cloudwatch_event_rule" "karpenter_instance_terminate" {
  name        = format("%s-karpenter-instance-terminate", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.autoscaling"]
    detail-type = [
      "EC2 Instance-terminate Lifecycle Action"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_instance_terminate" {
  rule      = aws_cloudwatch_event_rule.karpenter_instance_terminate.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter.arn
}


resource "aws_cloudwatch_event_rule" "karpenter_scheduled_change" {
  name        = format("%s-karpenter-scheduled-change", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.health"]
    detail-type = [
      "AWS Health Event"
    ]
    detail = {
      service = [
        "EC2"
      ]
      eventTypeCategory = [
        "scheduledChange"
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "karpenter_scheduled_change" {
  rule      = aws_cloudwatch_event_rule.karpenter_scheduled_change.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter.arn
}

resource "aws_cloudwatch_event_rule" "karpenter_spot_termination" {
  name        = format("%s-karpenter-spot-termination", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Spot Instance Interruption Warning"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_spot_termination" {
  rule      = aws_cloudwatch_event_rule.karpenter_spot_termination.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter.arn
}


resource "aws_cloudwatch_event_rule" "karpenter_rebalance" {
  name        = format("%s-karpenter-rebalance", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance Rebalance Recommendation"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_rebalance" {
  rule      = aws_cloudwatch_event_rule.karpenter_rebalance.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter.arn
}


resource "aws_cloudwatch_event_rule" "karpenter_state_change" {
  name        = format("%s-karpenter-state-change", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance State-change Notification"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_state_change" {
  rule      = aws_cloudwatch_event_rule.karpenter_state_change.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter.arn
}
