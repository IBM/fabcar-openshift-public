cat <<EOB > assets/console.yaml
apiVersion: ibp.com/v1alpha1
kind: IBPConsole
metadata:
  name: ibpconsole
spec:
  license: accept
  serviceAccountName: default
  email: "<EMAIL>"
  password: "<PASSWORD>"
  image:
    imagePullSecret: "docker-key-secret"
  networkinfo:
    domain: <DOMAIN>
  storage:
    console:
      class: default
      size: 10Gi
EOB

kubectl apply -f assets/console.yaml -n ${PROJECT}