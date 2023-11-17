# data "aws_iam_policy_document" "aws_node_termination_handler_role" {
#   statement {
#     actions = ["sts:AssumeRoleWithWebIdentity"]
#     effect  = "Allow"

#     condition {
#       test     = "StringEquals"
#       variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
#       values = [
#         "system:serviceaccount:kube-system:aws-node-termination-handler"
#       ]
#     }

#     principals {
#       identifiers = [aws_iam_openid_connect_provider.eks.arn]
#       type        = "Federated"
#     }
#   }
# }

# resource "aws_iam_role" "aws_node_termination_handler_role" {
#   assume_role_policy = data.aws_iam_policy_document.aws_node_termination_handler_role.json
#   name               = format("%s-aws-node-termination-handler", var.cluster_name)
# }


# data "aws_iam_policy_document" "aws_node_termination_handler_policy" {
#   version = "2012-10-17"

#   statement {

#     effect = "Allow"
#     actions = [
#       "autoscaling:CompleteLifecycleAction",
#       "autoscaling:DescribeAutoScalingInstances",
#       "autoscaling:DescribeTags",
#       "ec2:DescribeInstances",
#       "sqs:DeleteMessage",
#       "sqs:ReceiveMessage"
#     ]

#     resources = [
#       "*"
#     ]

#   }
# }

# resource "aws_iam_policy" "aws_node_termination_handler_policy" {
#   name        = format("%s-aws_node_termination_handler", var.cluster_name)
#   path        = "/"
#   description = var.cluster_name

#   policy = data.aws_iam_policy_document.aws_node_termination_handler_policy.json
# }

# resource "aws_iam_policy_attachment" "aws_node_termination_handler_policy" {
#   name = "aws_node_termination_handler"
#   roles = [
#     aws_iam_role.aws_node_termination_handler_role.name
#   ]

#   policy_arn = aws_iam_policy.aws_node_termination_handler_policy.arn
# }
