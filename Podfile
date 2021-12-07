# Uncomment the next line to define a global platform for your project
platform :osx, '10.15'
source 'https://github.com/TwoRingSoft/podspecs.git'

abstract_target 'aocTargets' do
  # Comment the next line if you don't want to use dynamic frameworks

  unless ENV['FASTMATH_PATH'] == nil then
    pod 'FastMath', :path => ENV['FASTMATH_PATH'], :testspecs => ['Tests']
  else
    pod 'FastMath'
  end

  target 'aoc2020'
  target 'aoc2021'
  target 'aoc2020Tests'
  target 'aoc2021Tests'
end
