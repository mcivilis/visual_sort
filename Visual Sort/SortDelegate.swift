//
//  SortDelegate.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import Foundation

protocol SortDelegate {
    func sortDidFinishPreparing(with numbers: [Int])
    func sortDidChange()
    func sortDidFinish()
}
