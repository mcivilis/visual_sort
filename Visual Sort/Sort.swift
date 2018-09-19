//
//  Sort.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import Foundation
enum SortType {
    case insertion
    case bubble
    case selection
}
struct Sort {
    let type: SortType
    let description: String
    let algorithm: String
    
    init(with type: SortType) {
        self.type = type
        switch type {
        case .insertion:
            self.description = "Insertion Sort"
            self.algorithm = "Insertion sort algorithm - rank set of random numbers lowest to highest by inserting numbers based on a sorted and unsorted side. performance of O(n2)."
        case .bubble:
            self.description = "Bubble Sort"
            self.algorithm = "Bubble sort algorithm - rank items from the lowest to highest by swapping groups of two items from left to right. The highest item in the set will bubble up to the right side of the set after the first iteration. performance of O(n2)."
        case .selection:
            self.description = "Selection Sort"
            self.algorithm = "Selection sort algorithm - rank items from the lowest to highest by iterating through the array and swapping the current iteration with the lowest value in the rest of the array until it reaches the end of the array. performance of O(n2)."
        }
    }
}
