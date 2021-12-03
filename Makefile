init:
	brew bundle
	rbenv install --skip-existing
	rbenv exec bundle --update

xcode:
	xcodegen --spec AdventOfCode.yml
	rbenv exec bundle exec pod install

scaffold:
	xcrun xcodebuild -scheme createYear -derivedDataPath .
	./createYear/Build/Products/Debug/createYear
