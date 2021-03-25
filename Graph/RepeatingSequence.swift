//
//  RepeatingSequence.swift
//  Graph
//
//  Created by Yuki Tsukada on 2021/03/25.
//

import Foundation


func repeatingSequence() {
    
    let getInput = readLine()!.split(separator: " ").map { Int($0) }
    let firstNumber = getInput[0]!
    let exponent = getInput[1]!
    var alreadyAppearedNumber: Set = [firstNumber]
    var sequence: [Int] = [firstNumber]
    
    var currentNumber: Int = firstNumber
    var nextNumber: Int = 0
    var notLoopYet: Bool = true
    var count = 0
    while(notLoopYet) {
        while(currentNumber != 0) {
            nextNumber += Int(pow(Double(currentNumber % 10), Double(exponent)))
            currentNumber = (currentNumber - currentNumber % 10) / 10
        }
        if alreadyAppearedNumber.contains(nextNumber) {
            notLoopYet = false
            count = sequence.firstIndex(of: nextNumber)!
        }
        alreadyAppearedNumber.insert(nextNumber)
        sequence.append(nextNumber)
        currentNumber = nextNumber
        nextNumber = 0
    }
    print(count)
}
