
#!/bin/bash

if [ -z ${PROJECT} ]; then
	echo "PROJECT variable not set"
	exit 1
fi

cat <<EOB > assets/scc.yaml

allowHostDirVolumePlugin: true
allowHostIPC: true
allowHostNetwork: true
allowHostPID: true
allowHostPorts: true
allowPrivilegeEscalation: true
allowPrivilegedContainer: true
allowedCapabilities:
- NET_BIND_SERVICE
- CHOWN
- DAC_OVERRIDE
- SETGID
- SETUID
- FOWNER
apiVersion: security.openshift.io/v1
defaultAddCapabilities: null
fsGroup:
  type: RunAsAny
groups:
- system:cluster-admins
- system:authenticated
kind: SecurityContextConstraints
metadata:
  name: ${PROJECT}
readOnlyRootFilesystem: false
requiredDropCapabilities: null
runAsUser:
  type: RunAsAny
seLinuxContext:
  type: RunAsAny
supplementalGroups:
  type: RunAsAny
volumes:
- "*"
EOB

oc apply -f assets/scc.yaml

oc adm policy add-scc-to-user ${PROJECT} system:serviceaccounts:${PROJECT}
oc adm policy add-scc-to-group ${PROJECT} system:serviceaccounts:${PROJECT}
oc adm policy add-cluster-role-to-user ${PROJECT} system:serviceaccounts:${PROJECT}