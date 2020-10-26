#!/bin/bash

set -euxo pipefail

docker run --rm \
           --volume "$(pwd):/workdir" \
           --workdir /workdir \
           "quay.io/helmpack/chart-testing:v3.1.1" ct lint --config test/config.yaml --all
