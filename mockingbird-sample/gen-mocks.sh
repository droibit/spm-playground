#!/bin/bash
set -eu
cd "$(dirname "$0")"
swift package describe --type json > project.json

.build/checkouts/mockingbird/mockingbird generate --project project.json \
  --output-dir Sources/Mocks \
  --targets CoreRepository CoreSource \
  --only-protocols \
  --disable-swiftlint \