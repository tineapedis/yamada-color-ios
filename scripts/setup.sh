function build_cli_tools {
  echo "👻  Build SwiftLint👻"
  swift build -c release --package-path Tools --product swiftlint
}

function setup() {
  build_cli_tools
}

setup
