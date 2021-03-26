#!/bin/sh

# Credit to this Stack Exchange answer for explaining this:
# https://unix.stackexchange.com/a/343974/363304
SUCCESS_CHECKMARK=$(printf '\342\234\224\n' | iconv -f UTF-8)
CROSS_MARK=$(printf '\342\235\214\n' | iconv -f UTF-8)

set -eu

main() {
  echo "Hello world!"
}

main "$@"