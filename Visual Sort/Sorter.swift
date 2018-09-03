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
    let numbers: [Int]
    let sort: Sort
    
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
    
    func beginSort() {
        sortDelegate.sortIsReady(with: numbers)
    }
}
