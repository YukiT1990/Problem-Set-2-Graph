//
//  Cycle.swift
//  Graph
//
//  Created by Yuki Tsukada on 2021/03/25.
//

import Foundation

// Cyclic Permutation
func cycle() {
    let preNumberOfCases = readLine()!.split(separator: " ").map { Int($0) }
    let numberOfCases = preNumberOfCases[0]!

    
    for _ in 0..<numberOfCases {
        let preN = readLine()!.split(separator: " ").map { Int($0) }
        let N = preN[0]!
        let permutation = readLine()!.split(separator: " ").map { Int($0) }
        var alreadyPassed: Set = [1]
        var numOfCycles = 0
        for i in 1...permutation.count {
            // if the integer is already passed
            if alreadyPassed.contains(i) {
                continue
            }
            // if the integer has a roop
            if permutation[i - 1] == i {
                numOfCycles += 1
                continue
            }
            // search for a cycle
            var foundCycle: Bool = false
            var next = permutation[i - 1]!
            while (foundCycle == false) {
                alreadyPassed.insert(next)
                next = permutation[next - 1]!
                if alreadyPassed.contains(next) {
                    numOfCycles += 1
                    foundCycle = true
                }
            }
        }
        
        print(numOfCycles)
    }
}


