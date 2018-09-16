//
//  ArraySortExtention.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-09.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import Foundation

/// Returns an array of tuples representing a switch of elements
extension Array where Element: Comparable {
    func insertionSortSteps() -> [(Int, Int)] {
        // Check for trivial case
        var steps: [(Int, Int)] = []
        guard self.count > 1 else {
            return steps
        }
        var sortedArray: Array<Element> = self
        
        for primaryindex in 0..<sortedArray.count {
            let key = sortedArray[primaryindex]
            var secondaryindex = primaryindex
            while secondaryindex > -1 {
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
}
