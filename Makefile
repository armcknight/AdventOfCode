.PHONY: init
init:
	brew bundle
	rbenv install --skip-existing
	rbenv exec gem update bundler
	rbenv exec bundle update
	git submodule update --init --recursive
	make pods

.PHONY: pods
pods:
	FASTMATH_PATH="FastMath" PIPPIN_LIBRARY_PATH="Pippin" rbenv exec bundle exec pod update

.PHONY: update
update:
	xcrun xcodebuild -scheme update -derivedDataPath updateBuild | rbenv exec bundle exec xcpretty
	./updateBuild/Build/Products/Debug/update

.PHONY: test
test:
	xcodebuild -scheme aoc2020Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2021Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2015Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2016Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2017Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2018Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2019Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2022Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
