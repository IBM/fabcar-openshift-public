cat <<EOB > assets/clusterrolebinding.yaml
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: ${PROJECT}
subjects:
- kind: ServiceAccount
  name: default
  namespace: ${PROJECT}
roleRef:
  kind: ClusterRole
  name: ${PROJECT}
  apiGroup: rbac.authorization.k8s.io
EOB

kubectl apply -f assets/clusterrolebinding.yaml