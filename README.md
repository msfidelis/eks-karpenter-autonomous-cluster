<!-- BEGIN_TF_DOCS -->
# Welcome to Karpanter EKS Autonomous Cluster

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.4.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.10.1 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.node_termination_handler_instance_terminate](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_rebalance](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_scheduled_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_spot_termination](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_state_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_instance_terminate](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_rebalance](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_scheduled_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_spot_termination](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_state_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_ec2_tag.karpenter](https://registry.terraform.io/providers/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_eip.vpc_iep](https://registry.terraform.io/providers/aws/latest/docs/resources/eip) | resource |
| [aws_eks_addon.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kubeproxy](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_fargate_profile.cert_manager](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_fargate_profile) | resource |
| [aws_eks_fargate_profile.karpenter](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_fargate_profile) | resource |
| [aws_eks_fargate_profile.kube_system](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_fargate_profile) | resource |
| [aws_eks_fargate_profile.prometheus](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_fargate_profile) | resource |
| [aws_iam_instance_profile.nodes](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.karpenter_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.karpenter_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.aws_node_termination_handler_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.coredns_fix](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_fargate_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_roles](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.karpenter_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSFargatePodExecutionRolePolicy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSVPCResourceController](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.coredns_fix](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-service](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_kms_alias.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_key) | resource |
| [aws_lambda_function.coredns_fix](https://registry.terraform.io/providers/aws/latest/docs/resources/lambda_function) | resource |
| [aws_launch_template.main](https://registry.terraform.io/providers/aws/latest/docs/resources/launch_template) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.nat_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route.public_internet_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route_table.igw_route_table](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.coredns_fix](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.nodeport_eks](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport_eks_udp](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rule_443](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rule_53_tcp](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rule_53_udp](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rule_80](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rule_8080](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_sqs_queue.node_termination_handler](https://registry.terraform.io/providers/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.node_termination_handler](https://registry.terraform.io/providers/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_subnet.private_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.cluster_vpc](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.pods](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [helm_release.cert](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.karpenter](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.node_termination_handler](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.karpenter_provisioner](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.karpenter_template](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_config_map.aws-auth](https://registry.terraform.io/providers/kubernetes/latest/docs/resources/config_map) | resource |
| [archive_file.coredns_archive](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_node_termination_handler_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.coredns_fix](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_fargate_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_nodes_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_lambda_invocation.coredns_fix](https://registry.terraform.io/providers/aws/latest/docs/data-sources/lambda_invocation) | data source |
| [aws_ssm_parameter.eks](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_cni_version"></a> [addon\_cni\_version](#input\_addon\_cni\_version) | VPC CNI addon version | `string` | `"v1.12.6-eksbuild.1"` | no |
| <a name="input_addon_coredns_version"></a> [addon\_coredns\_version](#input\_addon\_coredns\_version) | CoreDNS addon version | `string` | `"v1.10.1-eksbuild.2"` | no |
| <a name="input_addon_kubeproxy_version"></a> [addon\_kubeproxy\_version](#input\_addon\_kubeproxy\_version) | KubeProxy addon version | `string` | `"v1.27.3-eksbuild.2"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region to deploy resources | `string` | `"us-east-1"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS Cluster Name | `string` | `"karpenter-cluster"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map` | <pre>{<br>  "Foo": "Bar",<br>  "Ping": "Pong"<br>}</pre> | no |
| <a name="input_fargate_profiles"></a> [fargate\_profiles](#input\_fargate\_profiles) | Name of fargate profiles created on cluster | `list(any)` | `[]` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Default Kubernetes Version | `string` | `"1.27"` | no |
| <a name="input_karpenter_availability_zones"></a> [karpenter\_availability\_zones](#input\_karpenter\_availability\_zones) | Availability zones to launch nodes | `list` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_karpenter_capacity_type"></a> [karpenter\_capacity\_type](#input\_karpenter\_capacity\_type) | Capacity Type; Ex spot, on\_demand | `list` | <pre>[<br>  "spot"<br>]</pre> | no |
| <a name="input_karpenter_cpu_limit"></a> [karpenter\_cpu\_limit](#input\_karpenter\_cpu\_limit) | CPU Limits to launch total nodes | `string` | `"100"` | no |
| <a name="input_karpenter_instance_family"></a> [karpenter\_instance\_family](#input\_karpenter\_instance\_family) | Instance family list to launch on karpenter | `list` | <pre>[<br>  "m5",<br>  "c5"<br>]</pre> | no |
| <a name="input_karpenter_instance_sizes"></a> [karpenter\_instance\_sizes](#input\_karpenter\_instance\_sizes) | Instance sizes to diversify into instance family | `list` | <pre>[<br>  "large",<br>  "2xlarge"<br>]</pre> | no |
| <a name="input_karpenter_memory_limit"></a> [karpenter\_memory\_limit](#input\_karpenter\_memory\_limit) | Memory Limits to launch total nodes | `string` | `"4000Gi"` | no |

## Outputs

No outputs.

## Author

👤 **Matheus Fidelis**

* Website: https://raj.ninja
* Twitter: [@fidelissauro](https://twitter.com/fidelissauro)
* Github: [@msfidelis](https://github.com/msfidelis)
* LinkedIn: [@msfidelis](https://linkedin.com/in/msfidelis)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](/issues).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2020 [Matheus Fidelis](https://github.com/msfidelis).<br />
This project is [MIT](LICENSE) licensed.
<!-- END_TF_DOCS -->