variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name"
  default     = "karpenter-cluster"
}

variable "aws_region" {
  type        = string
  description = "AWS Region to deploy resources"
  default     = "us-east-1"
}

variable "k8s_version" {
  type        = string
  description = "Default Kubernetes Version"
  default     = "1.24"
}

variable "default_tags" {
  default = {
    Foo  = "Bar"
    Ping = "Pong"
  }
}

variable "fargate_profiles" {
  type        = list(any)
  description = "Name of fargate profiles created on cluster"
  default     = []
}

variable "karpenter_instance_family" {
  type = list
  description = "Instance family list to launch on karpenter"
  default = [
    "m5",
    "c5"
  ]
}

variable "karpenter_instance_sizes" {
  type = list 
  description = "Instance sizes to diversify into instance family"
  default = [
    "large",
    "2xlarge"
  ]
}

variable "karpenter_capacity_type" {
  type = list
  description = "Capacity Type; Ex spot, on_demand"
  default = [
    "spot"
  ]
}

variable "karpenter_availability_zones" {
  type = list
  description = "Availability zones to launch nodes"
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "karpenter_cpu_limit" {
  type    = string
  description = "CPU Limits to launch total nodes"
  default = "100"
}

variable "karpenter_memory_limit" {
  type        = string
  description = "Memory Limits to launch total nodes"  
  default     = "4000Gi"
}

variable "addon_coredns_version" {
  type        = string
  description = "CoreDNS addon version"
  default     =  "v1.9.3-eksbuild.3"
}

variable "addon_kubeproxy_version" {
  type        = string
  description = "KubeProxy addon version"  
  default     = "v1.24.10-eksbuild.2"
}

variable "addon_cni_version" {
  type        = string
  description = "VPC CNI addon version"  
  default     = "v1.12.6-eksbuild.2"
}