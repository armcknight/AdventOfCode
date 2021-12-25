init:
	brew bundle
	rbenv install --skip-existing
	rbenv exec bundle update
	git submodule sync --init --recursive

xcode:
	xcodegen --spec AdventOfCode.yml
	FASTMATH_PATH="FastMath" PIPPIN_LIBRARY_PATH="Pippin" rbenv exec bundle exec pod update
	xed AdventOfCode.xcworkspace

scaffold:
	xcrun xcodebuild -scheme createYear -derivedDataPath createYearBuild | rbenv exec bundle exec xcpretty
	cp ./createYearBuild/Build/Products/Debug/createYear ./create-year
	rm -rf ./createYearBuild
	./create-year
