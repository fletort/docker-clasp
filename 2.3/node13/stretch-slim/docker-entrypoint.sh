#!/bin/bash
set -e

if [ "${1#-}" != "${1}" ] || [ "$1" == "help" ]  || [ "$1" == "login" ] || [ "$1" == "logout" ] || [ "$1" == "open" ] || [ -z "$(command -v "${1}")" ]; then
  set -- clasp "$@"
fi

exec "$@"