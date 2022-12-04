init:
	brew bundle
	rbenv install --skip-existing
	rbenv exec gem update bundler
	rbenv exec bundle update
	git submodule update --init --recursive
	make pods

pods:
	FASTMATH_PATH="FastMath" PIPPIN_LIBRARY_PATH="Pippin" rbenv exec bundle exec pod update

update:
	xcrun xcodebuild -scheme createYear -derivedDataPath createYearBuild | rbenv exec bundle exec xcpretty
	cp ./createYearBuild/Build/Products/Debug/createYear ./create-year
	rm -rf ./createYearBuild
	./create-year

test:
	xcodebuild -scheme aoc2020Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2021Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
	xcodebuild -scheme aoc2022Tests -workspace AdventOfCode.xcworkspace test 2>/dev/null | rbenv exec bundle exec xcpretty -t
