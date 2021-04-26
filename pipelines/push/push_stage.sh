#!/bin/bash
# Exportamos las variables hacia el builder
echo $BUILD_NUMBER > /tmp/.powerbattery_aden_org

scp /tmp/.powerbattery_aden_org 172.18.0.1:/tmp/.powerbattery_aden_org
ssh 172.18.0.1 sudo /home/jenkins/workspace/devops-jenkins/powerbattery_aden_org/pipelines/push/push_stage.sh
