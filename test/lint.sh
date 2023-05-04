#!/bin/bash

set -euxo pipefail

CHARTS="$@"
CHART_TESTING_VERSION="3.7.0"

if [ -z "$CHARTS" ]; then
  CHARTS="--all"
else
  CHARTS="--charts $CHARTS"
fi

docker run --rm \
           --volume "$(pwd):/workdir" \
           --workdir /workdir \
           "quay.io/helmpack/chart-testing:v${CHART_TESTING_VERSION}" ct lint --config test/config.yaml --lint-conf test/lintconf.yaml $CHARTS
