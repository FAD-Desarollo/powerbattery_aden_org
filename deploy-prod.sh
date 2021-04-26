#!/bin/bash

echo *-*-*-*-*-*-*-*
echo *- DEPLOYING -*
echo *-*-*-*-*-*-*-*

export REGISTRY="gcr.io"
export PROJECT="odoo-erp-calendar"
export IMAGE="powerbattery_aden_org"
export BUILD_TAG=$(sed -n '1p' /tmp/.powerbattery_aden_org)
echo BUILD_TAG=$(sed -n '1p' /tmp/.powerbattery_aden_org) > /home/jenkins/project/powerbattery_aden_org/.env
PWDD=/home/jenkins/project/powerbattery_aden_org
compose="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWDD:$PWDD" -w="$PWDD" docker/compose:1.27.4"

# DESCARGAMOS LA ULTIMA IMAGEN
docker pull $REGISTRY/$PROJECT/$IMAGE:$BUILD_TAG

# LEVANTAMOS NUEVAMENTE
$compose up -d
