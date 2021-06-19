#!/usr/bin/env bash

readonly keycloak_dir="keycloak-14.0.0"

./${keycloak_dir}/bin/standalone.sh -b 0.0.0.0
