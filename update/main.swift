//
//  main.swift
//  update
//
//  Created by Andrew McKnight on 12/11/20.
//

import Foundation
import Then

for year in 2015 ... AoC.Date.currentYear {
    createSourceFiles(for: year)
    injectMissingTestTasks(for: year)
}

generateXcodeGenSpec()
generateXcodeProject()
openXcodeProject()
