#!/bin/bash

ANOSWAY_SRC="https://github.com/Anonoei/anosway"

ANOSWAY_ROOT="${HOME}/.config/sway"

echo "Cloning AnoMUX..."
if [[ -d "${ANOSWAY_ROOT}" ]]; then
    rm -rf "${ANOSWAY_ROOT}"
fi
git clone $ANOSWAY_SRC "${ANOSWAY_ROOT}"
