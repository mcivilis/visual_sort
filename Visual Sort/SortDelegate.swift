//
//  SortDelegate.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import Foundation

protocol SortDelegate {
    func sortIsReady(with numbers: [Int])
    func sortDidChange(with numbers: [Int])
}
