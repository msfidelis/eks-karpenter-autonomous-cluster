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
  default     = "1.22"
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
  default = [
    "m5",
    "c5"
  ]
}

variable "karpenter_instance_sizes" {
  type = list 
  default = [
    "large",
    "2xlarge"
  ]
}

variable "karpenter_capacity_type" {
  type = list
  default = [
    "spot"
  ]
}

variable "karpenter_availability_zones" {
  type = list
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "karpenter_cpu_limit" {
  default = "100"
}

variable "karpenter_memory_limit" {
  default = "4000Gi"
}