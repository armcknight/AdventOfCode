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
	xcodebuild -scheme aoc2020Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2021Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2015Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2016Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2017Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2018Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2019Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2022Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2023Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
