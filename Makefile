.PHONY: init
init:
	brew bundle
	git submodule update --init --recursive

.PHONY: update
update:
	xcrun xcodebuild -scheme update -derivedDataPath updateBuild | xcbeautify
	./updateBuild/Build/Products/Debug/update

.PHONY: test
test:
	xcodebuild -scheme aoc2020Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
	xcodebuild -scheme aoc2021Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
	xcodebuild -scheme aoc2015Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
	xcodebuild -scheme aoc2016Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
	xcodebuild -scheme aoc2017Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
	xcodebuild -scheme aoc2018Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
	xcodebuild -scheme aoc2019Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
	xcodebuild -scheme aoc2022Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | xcbeautify
