#!/bin/bash

. "$(dirname "${BASH_SOURCE[0]}")"/formatting.sh

declare -r -x -A ERROR=(
  [prefix]="error: "
  [format]="${RED}"
)

declare -r -x -A WARNING=(
  [prefix]="warning: "
  [format]="${YELLOW}"
)

declare -r -x -A INFO=(
  [prefix]="info: "
  [format]="${WHITE}"
)

declare -r -x -A DEBUG=(
  [prefix]="debug: "
  [format]="${BLACK}"
)

declare -r -x -A NORMAL=(
  [prefix]=""
  [format]="${WHITE}"
)

declare -r -x -A SECTION=(
  [prefix]=""
  [format]="${BLUE}"
)
