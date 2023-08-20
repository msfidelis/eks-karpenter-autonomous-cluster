apiVersion: karpenter.k8s.aws/v1alpha1
kind: AWSNodeTemplate
metadata:
  name: ${EKS_CLUSTER}
spec:
  subnetSelector:
    karpenter.sh/discovery: ${EKS_CLUSTER}
  launchTemplate: ${LAUNCH_TEMPLATE}