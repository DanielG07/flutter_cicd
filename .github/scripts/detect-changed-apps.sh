#!/bin/bash
set -e

  # Crear string separado por comas
  APPS_STRING="'vitam_asesor','vitam_usuario'"

  APPS_JSON="[$APPS_STRING]"

  # Debugar outputs
  echo "DEBUG STRING: $APPS_STRING"
  echo "DEBUG JSON: $APPS_JSON"

  # Outputs para GitHub Actions
  echo "has-changes=true" >> $GITHUB_OUTPUT
  echo "changed-apps=$APPS_STRING" >> $GITHUB_OUTPUT
  echo "apps-matrix={include:$APPS_JSON}" >> $GITHUB_OUTPUT

  echo ""
  echo "GitHub Actions outputs:"
  echo "  has-changes: true"
  echo "  changed-apps: $APPS_STRING"
  echo "  apps-matrix: $APPS_JSON"


echo "================================"
echo "✅ Detection completed"
