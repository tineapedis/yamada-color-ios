function build_cli_tools {
  echo "👻  Build SwiftLint👻"
  swift build -c release --package-path Tools --product swiftlint
  echo "👻  Build SwiftGen👻"
  swift build -c release --package-path Tools --product swiftgen
}

function setup() {
  build_cli_tools
}

setup
