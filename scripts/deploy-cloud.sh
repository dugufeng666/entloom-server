#!/usr/bin/env bash
set -euo pipefail

echo "This script builds the production image for a container platform."
echo "Provide registry credentials and deployment settings through your CI/CD environment."
docker build -t "${ENTLOOM_IMAGE:-entloom-server:local}" .
