setup:
		sh ./scripts/setup.sh

lint:
		swift run -c release --package-path Tools swiftlint --fix --format
		swift run -c release --package-path Tools swiftlint