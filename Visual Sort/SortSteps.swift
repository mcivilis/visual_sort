//
//  SortSteps.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-09.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import Foundation
/// Returns an array of tuples representing a switch of elements
class SortSteps {
    class func insertionSort(for array: [Int]) -> [(Int, Int)] {
        // Check for trivial case
        var steps: [(Int, Int)] = []
        guard array.count > 1 else {
            return steps
        }
        //mutated copy
        var sortedArray: [Int] = array
        
        for primaryindex in 0..<sortedArray.count {
            let key = sortedArray[primaryindex]
            var secondaryindex = primaryindex
            while secondaryindex > -1 {
                print("comparing \(key) and \(sortedArray[secondaryindex])")
                if key < sortedArray[secondaryindex] {
                    // Move into correct position
                    sortedArray.remove(at: secondaryindex + 1)
                    sortedArray.insert(key, at: secondaryindex)
                    
                    // Record step
                    steps.append((secondaryindex + 1, secondaryindex))
                }
                secondaryindex -= 1
            }
        }
        return steps
    }
    class func bubbleSort(for array: [Int]) -> [(Int, Int)] {
        //check for trivial case
        var steps: [(Int, Int)] = []
        guard array.count > 1 else {
            return steps
        }
        //mutated copy
        var sortedArray: [Int] = array
        
        for primaryIndex in 0..<array.count {
            let passes = (sortedArray.count - 1) - primaryIndex
            //"half-open" range operator
            for secondaryIndex in 0..<passes {
                let key = sortedArray[secondaryIndex]
                print("comparing \(key) and \(sortedArray[secondaryIndex + 1])")
                //compare / swap positions
                if (key > sortedArray[secondaryIndex + 1]) {
                    // Move into correct position
                    sortedArray.swapAt(secondaryIndex, secondaryIndex + 1)
                    
                    // Record step
                    steps.append((secondaryIndex, secondaryIndex + 1))
                }
            }
        }
        return steps
    }
    class func selectionSort(for array: [Int]) -> [(Int, Int)] {
        //check for trivial case
        var steps: [(Int, Int)] = []
        guard array.count > 1 else {
            return steps
        }
        //mutated copy
        var sortedArray: [Int] = array
        
        for primaryindex in 0..<sortedArray.count {
            var minimum = primaryindex
            var secondaryindex = primaryindex + 1
            
            while secondaryindex < sortedArray.count {
                print("comparing \(sortedArray[minimum]) and \(sortedArray[secondaryindex])")
                // store lowest value as minimum
                if sortedArray[minimum] > sortedArray[secondaryindex] {
                    minimum = secondaryindex
                }
                secondaryindex += 1
            }
            // swap minimum value with array iteration
            if primaryindex != minimum {
                // Move into correct position
                sortedArray.swapAt(primaryindex, minimum)
                
                // Record step
                steps.append((primaryindex, minimum))
            }
        }
        return steps
    }
}
