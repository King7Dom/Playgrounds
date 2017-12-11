//: [Previous](@previous)

import Foundation

/// Given an array

let array = [1, 0, 2, 0, 0, 3, 4]

/// implement methods that returns the number of non-zero elements (4)
/// Moves the non-zero elements to the beginning of the array (the rest of the elements don't matter)
/// Both [ 1, 2, 3, 4, 0, 0, 0] and [ 4, 1, 3, 2, X, Y, Z ] are valid

func sort(array: [Int]) -> [Int] {
    var nonZeroElements = [Int]()
    var zeroCount = 0
    
    array.forEach {
        if $0 > 0 {
            nonZeroElements.append($0)
        } else {
            zeroCount += 1
        }
    }
    
    for _ in 0...zeroCount {
        nonZeroElements.append(0)
    }
    
    return nonZeroElements
}

sort(array: array)

//: [Next](@next)

