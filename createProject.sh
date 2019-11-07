if [ -z ${PROJECT} ]; then
	echo "error - you need to set PROJECT environmental variable"
	echo "export PROJECT=<project-name>"
	exit 1
fi

oc new-project ${PROJECT}

oc project ${PROJECT}