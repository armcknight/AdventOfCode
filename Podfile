platform :osx, '10.15'
source 'https://github.com/TwoRingSoft/podspecs.git'

abstract_target 'aocTargets' do
  unless ENV['FASTMATH_PATH'] == nil then
    pod 'FastMath', :path => ENV['FASTMATH_PATH'], :testspecs => ['Tests']
  else
    pod 'FastMath'
  end

  unless ENV['PIPPIN_LIBRARY_PATH'] == nil then
    pod 'PippinLibrary', :path => ENV['PIPPIN_LIBRARY_PATH'], :testspecs => ['Tests']
  else
    pod 'PippinLibrary'
  end

  target 'aoc2020'
  target 'aoc2020Tests'
  target 'aoc2021'
  target 'aoc2021Tests'
  target 'aoc2022'
  target 'aoc2022Tests'
end
