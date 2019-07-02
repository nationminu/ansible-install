#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
. ${BASEDIR}/../env.sh

unset JAVA_OPTS 

${JBOSS_HOME}/bin/jboss-cli.sh  --controller=${CONTROLLER_IP}:${CONTROLLER_PORT} --connect <<EOF
batch 
patch apply --override-all $1 
run-batch
exit
EOF
