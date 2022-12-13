//
//  Day07Part1.swift
//  aoc2022
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

import aocHelpers
import Foundation
import SwiftArmcknight

// TODO: split array by regex

class Dir {
    var name: String
    var subdirs = [Dir]()
    var size = 0
    var parent: Dir? = nil

    init(name: String) {
        self.name = name
    }

    func find(subdirNamed name: String) -> Dir? {
        subdirs.filter { dir in
            dir.name == name
        }.first
    }

    func totalSize() -> Int {
        return size + subdirs.reduce(0, { partialResult, subdir in
            partialResult + subdir.totalSize()
        })
    }
}

let root = Dir(name: "/")
var allDirectories = [root]
let limit = 100000

func buildFilesystem(input: String) {
    var currentWorkingDirectory = root

    input.lines.forEach { line in
        if line.contains("$ cd") {
            let dir = String(line.components(separatedBy: "$ cd ").last!)
            if dir == "/" {
                currentWorkingDirectory = root
            } else if dir == ".." {
                currentWorkingDirectory = currentWorkingDirectory.parent ?? root
            } else {
                if let subDir = currentWorkingDirectory.find(subdirNamed: dir) {
                    currentWorkingDirectory = subDir
                    print("moving to known subdir")
                } else {
                    let newSubDir = Dir(name: dir)
                    newSubDir.parent = currentWorkingDirectory
                    currentWorkingDirectory.subdirs.append(newSubDir)
                    currentWorkingDirectory = newSubDir
                    print("moving to unknown subdir")
                }
            }
            print("moved to dir \(currentWorkingDirectory.name)")
        } else if line.contains("dir ") {
            let newSubdir = Dir(name: String(line.components(separatedBy: "dir ").last!))
            newSubdir.parent = currentWorkingDirectory
            currentWorkingDirectory.subdirs.append(newSubdir)
            print("adding dir \(newSubdir.name) to list")
            allDirectories.append(newSubdir)
        } else if line == "$ ls" {
            print("listing \(currentWorkingDirectory.name)")
            return
        } else {
            let result = try! line.regexResult(from: #"(\d*) (.*)"#)
            let size = Int(result[1, line])!
            let name = result[2, line]
            currentWorkingDirectory.size += size
            print("adding file \(name) size \(size) to dir \(currentWorkingDirectory.name) size")
        }
    }
}
public extension Day07 {
    var part1: Int {
        buildFilesystem(input: rawValue)
        return allDirectories.reduce(0) { partialResult, dir in
            let size = dir.totalSize()
            if size <= limit {
                return partialResult + size
            } else {
                return partialResult
            }
        }
    }
}
