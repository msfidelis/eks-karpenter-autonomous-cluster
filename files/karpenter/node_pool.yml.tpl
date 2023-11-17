---
apiVersion: karpenter.sh/v1beta1
kind: NodePool
metadata:
  name:  ${EKS_CLUSTER}
spec:
  disruption:
    consolidationPolicy: WhenUnderutilized
    expireAfter: Never
  limits:
    cpu: ${CPU_LIMIT}  
    memory: ${MEMORY_LIMIT}
  template:
    metadata: {}
    spec:
      nodeClassRef:
        name:  ${EKS_CLUSTER}
      requirements:
      - key: karpenter.k8s.aws/instance-family
        operator: In
        values:
%{ for ifm in INSTANCE_FAMILY ~}        
        - ${ifm}
%{ endfor ~}  
      - key: karpenter.sh/capacity-type
        operator: In
        values:
%{ for cpct in CAPACITY_TYPE ~}
        - ${cpct}
%{ endfor ~}  
      - key: karpenter.k8s.aws/instance-size
        operator: In
        values:
%{ for ifs in INSTANCE_SIZES ~}        
        - ${ifs}
%{ endfor ~}
      - key: topology.kubernetes.io/zone
        operator: In
        values:
%{ for az in AVAILABILITY_ZONES ~}
        - ${az}
%{ endfor ~}