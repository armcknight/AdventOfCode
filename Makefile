.PHONY: init
init:
	brew bundle
	git submodule update --init --recursive

.PHONY: update
update:
	xcrun xcodebuild -project update.xcodeproj -scheme update -derivedDataPath updateBuild | xcbeautify
	./updateBuild/Build/Products/Debug/update

.PHONY: test
test:
	xcodebuild -scheme aoc2015Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2016Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2017Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2018Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2019Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2020Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2021Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2022Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2023Tests -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci

.PHONY: benchmark
benchmark:
	xcodebuild -scheme aoc2015Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2016Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2017Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2018Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2019Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2020Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2021Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2022Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
	xcodebuild -scheme aoc2023Benchmarks -project AdventOfCode.xcodeproj test 2>/dev/null | xcbeautify --quieter --is-ci
