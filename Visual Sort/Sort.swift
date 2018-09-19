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
    
    init(with type: SortType) {
        self.type = type
        switch type {
        case .insertion:
            self.description = "Insertion Sort"
        case .bubble:
            self.description = "Bubble Sort"
        case .selection:
            self.description = "Selection Sort"
        }
    }
}
