#!/bin/bash
set -e

if docker ps | grep rstudio 2>&1 > /dev/null; then
  docker exec -ti rstudio "$@"
else
  echo "rstudio is not running"
  exit 1 
fi
