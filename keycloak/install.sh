#!/usr/bin/env bash
set -e

readonly keycloak_file="keycloak-14.0.0.tar.gz"

echo "Start download of keycloak"
curl -L -O "https://github.com/keycloak/keycloak/releases/download/14.0.0/${keycloak_file}"

echo "Extraction file"
tar -xf keycloak-14.0.0.tar.gz

echo "Config admin password"
./${keycloak_file}/bin/./add-user-keycloak.sh -u admin

rm ${keycloak_file}

echo "Install completed."