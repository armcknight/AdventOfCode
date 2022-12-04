//
//  main.swift
//  update
//
//  Created by Andrew McKnight on 12/11/20.
//

import Foundation
import Then

for year in 2016 ..< AoC.Date.currentYear {
    createSourceFiles(for: year)
    injectMissingTestTasks(for: year)
    injectMissingPodfileTargets(for: year)
}

generateXcodeGenSpec()
generateXcodeProject()

reinstallPods()

openXcodeProject()
