---
apiVersion: karpenter.k8s.aws/v1beta1
kind: EC2NodeClass
metadata:
  name: ${EKS_CLUSTER}
spec:
  amiFamily: AL2
  role: ${KARPENTER_NODE_ROLE}
  securityGroupSelectorTerms: 
  - id: ${EKS_SECURITY_GROUP}
  subnetSelectorTerms:
  - tags:
      karpenter.sh/discovery: ${EKS_CLUSTER}
  tags:
    Name: ${EKS_CLUSTER}