#!/usr/bin/env bash
set -euo pipefail

docker compose up --build -d
docker compose ps
echo "Entloom server is available at http://localhost:8080"
