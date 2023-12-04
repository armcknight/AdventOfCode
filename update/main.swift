//
//  main.swift
//  update
//
//  Created by Andrew McKnight on 12/11/20.
//

import Foundation
import Then

//func getYear(year: Int) {
//    createSourceFiles(for: year)
//    injectMissingTestTasks(for: year)
//}
//
//if let year = ProcessInfo.processInfo.environment["year"], let yearValue = Int(year) {
//    getYear(year: yearValue)
//} else {
//    for year in 2015 ... AoC.Date.currentYear {
//        getYear(year: year)
//    }
//}

generateXcodeGenSpec()
generateXcodeProject()
