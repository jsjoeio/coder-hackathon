#!/bin/sh

# Credit to this Stack Exchange answer for explaining this:
# https://unix.stackexchange.com/a/343974/363304
SUCCESS_CHECKMARK=$(printf '\342\234\224\n' | iconv -f UTF-8)
CROSS_MARK=$(printf '\342\235\214\n' | iconv -f UTF-8)

set -eu

get_node_version() {
  # Check that they have node installed
  if ! [ -x "$(command -v node)" ]; then
    echo "$CROSS_MARK node could not be found."
    echo "Are you sure you want to be running the Node.js Workspace Builder?"
    echo "Check that node is installed with 'node --version' locally."
    exit 1
  fi

  NODE_VERSION=$(node --version)
  echo "$SUCCESS_CHECKMARK Found node $NODE_VERSION"
}

get_yarn_version() {
  # Check if they have yarn installed globally
  if [ -x "$(command -v yarn)" ]; then
    YARN_VERSION=$(yarn --version)
    echo "$SUCCESS_CHECKMARK Found yarn v$YARN_VERSION"
  fi
}


get_global_npm_packages() {
  echo "Grabbing global npm packages"
  # npm list -g --depth 0 --json
  # TODO check if this works for global yarn packages too
  # grab json, loop through and get package and version
  # build an array associative? [package, version]
}

get_global_yarn_packages() {
  echo "Grabbing global yarn packages"
  # for yarn, run yarn global list --depth=0
  # comes back like this "code-server@3.9.2"
  # need to parse it
}

write_dockerfile() {
  echo "Writing Dockerfile"
}

main() {
  echo "Running Node.js Workspace Builder..."
  get_node_version
  get_yarn_version
}

main "$@"