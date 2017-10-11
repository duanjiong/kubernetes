#!/usr/bin/env bash
version=$1
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
K8S_HOME=$(dirname "${SCRIPTPATH}")

source "${K8S_HOME}/script/common.sh"

ensure_dir
if [ -n "$version" ]
then
  link_dynamic_dir
  docker_login
else
  upgrade_docker
fi