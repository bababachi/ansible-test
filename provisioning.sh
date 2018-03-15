#!/usr/bin/env bash

set -eux

ENV=$1
OPT=${2:-hoge}

SCRIPT_DIR=$(cd $(dirname $0);pwd)
pushd ${SCRIPT_DIR}
    if [ ${OPT} = 'noop' ]; then
        ENVIRONMENT=$1 ansible-playbook -i inventory/${ENV} site.yml -u centos --private-key="../tiara.pem" --check --diff 
    else
        ENVIRONMENT=$1 ansible-playbook -i inventory/${ENV} site.yml -u centos --private-key="../tiara.pem" 
    fi 
popd

