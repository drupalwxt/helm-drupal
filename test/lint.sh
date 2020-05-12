#!/bin/bash

set -euxo pipefail

docker run --rm \
           --volume "$(pwd):/workdir" \
           --workdir /workdir \
           "quay.io/helmpack/chart-testing:v2.4.1" ct lint --config test/config.yaml --all
