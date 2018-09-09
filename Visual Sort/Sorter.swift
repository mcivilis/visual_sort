//
//  Sorter.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import UIKit
class Sorter {
    let sortDelegate: SortDelegate
    let sort: Sort
    var numbers: [Int]
    
    init(with sort: Sort, delegate: SortDelegate, max: Int) {
        self.sortDelegate = delegate
        self.sort = sort
        var numbers = Array(1...max)
        var shuffled = [Int]()
        for _ in 0..<numbers.count {
            let randomPosition = Int(arc4random_uniform(UInt32(numbers.count)))
            shuffled.append(numbers[randomPosition])
            numbers.remove(at: randomPosition)
        }
        self.numbers = shuffled
    }
    
    func prepareToSort() {
        //sortDelegate.sortIsReady(with: numbers)
    }
    func beginSort() {
        insertionSort(for: 0)
        // trigger UI update of the sort visualization
        //sortDelegate.sortDidChange(with: numbers)
    }
    func continueSort(for index: Int) {
        if index < numbers.count {
            insertionSort(for: index)
            // trigger UI update of the sort visualization
            //sortDelegate.sortDidChange(with: numbers)
        } else {
            sortDelegate.sortDidFinish()
        }
    }
}
private extension Sorter {
    func insertionSort(for primaryindex: Int) {
        // check for trivial case
        guard numbers.count > 1 else {
            sortDelegate.sortDidFinish()
            return
        }
        let key = numbers[primaryindex]
        var secondaryindex = primaryindex
        while secondaryindex > -1 {
            if key < numbers[secondaryindex] {
                // move to correct position
                numbers.remove(at: secondaryindex + 1)
                numbers.insert(key, at: secondaryindex)
            }
            secondaryindex -= 1
        }
    }
}
