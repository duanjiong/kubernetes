#!/usr/bin/env bash

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
K8S_HOME=$(dirname "${SCRIPTPATH}")

source "${K8S_HOME}/script/common.sh"

systemctl is-active kubelet >/dev/null 2>&1 && {
    if [ "${HOST_ROLE}" == "master" ]
    then
        retry mykubectl delete -f /etc/kubernetes/addons/qingcloud/clean-log-job.yaml
        retry mykubectl create -f /etc/kubernetes/addons/qingcloud/clean-log-job.yaml
    fi
}

