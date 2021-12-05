init:
	brew bundle
	rbenv install --skip-existing
	rbenv exec bundle update

xcode:
	xcodegen --spec AdventOfCode.yml
	rbenv exec bundle exec pod install

scaffold:
	xcrun xcodebuild -scheme createYear -derivedDataPath createYearBuild | rbenv exec bundle exec xcpretty
	cp ./createYearBuild/Build/Products/Debug/createYear ./create-year
	rm -rf ./createYearBuild
	./create-year
