resource "helm_release" "node_termination_handler" {
  name      = "aws-node-termination-handler"
  namespace = "kube-system"

  chart      = "aws-node-termination-handler"
  repository = "https://aws.github.io/eks-charts/"
  version    = "0.21.0"

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.aws_node_termination_handler_role.arn
  }

  set {
    name  = "awsRegion"
    value = var.aws_region
  }

  set {
    name  = "queueURL"
    value = aws_sqs_queue.node_termination_handler.url
  }

  set {
    name  = "enableSqsTerminationDraining"
    value = true
  }

  set {
    name  = "enableSpotInterruptionDraining"
    value = true
  }

  set {
    name  = "enableRebalanceMonitoring"
    value = true
  }

  set {
    name  = "enableRebalanceDraining"
    value = true
  }

  set {
    name  = "enableScheduledEventDraining"
    value = true
  }

  set {
    name  = "deleteSqsMsgIfNodeNotFound"
    value = true
  }

    set {
    name  = "checkTagBeforeDraining"
    value = false
  }
}

resource "aws_sqs_queue" "node_termination_handler" {
  name                       = format("%s-aws-node-termination-handler", var.cluster_name)
  delay_seconds              = 0
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 60
}

resource "aws_sqs_queue_policy" "node_termination_handler" {
  queue_url = aws_sqs_queue.node_termination_handler.id
  policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "sqs:SendMessage"
      ],
      "Resource": [
        "${aws_sqs_queue.node_termination_handler.arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_cloudwatch_event_rule" "node_termination_handler_instance_terminate" {
  name        = format("%s-node-termination-handler-instance-terminate", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.autoscaling"]
    detail-type = [
      "EC2 Instance-terminate Lifecycle Action"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_instance_terminate" {
  rule      = aws_cloudwatch_event_rule.node_termination_handler_instance_terminate.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler.arn
}


resource "aws_cloudwatch_event_rule" "node_termination_handler_scheduled_change" {
  name        = format("%s-node-termination-handler-scheduled-change", var.cluster_name)
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

resource "aws_cloudwatch_event_target" "node_termination_handler_scheduled_change" {
  rule      = aws_cloudwatch_event_rule.node_termination_handler_scheduled_change.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler.arn
}

resource "aws_cloudwatch_event_rule" "node_termination_handler_spot_termination" {
  name        = format("%s-node-termination-handler-spot-termination", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Spot Instance Interruption Warning"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_spot_termination" {
  rule      = aws_cloudwatch_event_rule.node_termination_handler_spot_termination.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler.arn
}


resource "aws_cloudwatch_event_rule" "node_termination_handler_rebalance" {
  name        = format("%s-node-termination-handler-rebalance", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance Rebalance Recommendation"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_rebalance" {
  rule      = aws_cloudwatch_event_rule.node_termination_handler_rebalance.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler.arn
}


resource "aws_cloudwatch_event_rule" "node_termination_handler_state_change" {
  name        = format("%s-node-termination-handler-state-change", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance State-change Notification"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_state_change" {
  rule      = aws_cloudwatch_event_rule.node_termination_handler_state_change.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler.arn
}
