#!/bin/bash

echo *-*-*-*-*-*-*-*-*-*-*
echo *- DEPLOYING PROD -*
echo *-*-*-*-*-*-*-*-*-*-*

echo $BUILD_NUMBER > /tmp/.powerbattery_aden_org

# COPIAMOS VARIABLES A SERVIDOR REMOTO
scp /tmp/.powerbattery_aden_org jenkins@35.247.200.184:/tmp/.powerbattery_aden_org

# COPIAMOS CODIGO ACTUALIZADO A SERVIDOR REMOTO
ssh jenkins@35.247.200.184 mkdir -p /home/jenkins/project/powerbattery_aden_org
scp /var/jenkins_home/workspace/powerbattery_aden_org/deploy-prod.sh /var/jenkins_home/workspace/powerbattery_aden_org/*.yml jenkins@35.247.200.184:/home/jenkins/project/powerbattery_aden_org/

# EJECUCION DE SCRIPT DE DEPLOY EN SERVIDOR REMOTO
ssh jenkins@35.247.200.184 sh /home/jenkins/project/powerbattery_aden_org/deploy-prod.sh
