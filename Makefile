init:
	rbenv install --skip-existing
	rbenv exec bundle
	xcodegen --spec AdventOfCode.yml
	rbenv exec bundle exec pod install
