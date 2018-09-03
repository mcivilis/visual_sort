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
    case merge
}
struct Sort {
    let type: SortType
    let description: String
    
    init(with type: SortType) {
        self.type = type
        switch type {
        case .insertion:
            self.description = "INSERTION SORT"
        case .bubble:
            self.description = "BUBBLE SORT"
        case .selection:
            self.description = "SELECTION SORT"
        case .merge:
            self.description = "MERGE SORT"
        }
    }
}
