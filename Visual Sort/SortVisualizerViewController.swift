//
//  SortVisualizerViewController.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import UIKit

class SortVisualizerViewController: UIViewController {
    
    /// Container view for sorting visualization
    @IBOutlet var sortContainer: UIView!
    
    /// `Sort` that is currently being visualized.
    var sort: Sort?
    
    /// `Sorter` provides visialization data.
    var sorter: Sorter?
    
    /// Constant that determines the number of items to sort
    let numberOfItemsToSort: Int = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let sort = sort {
            // Set navigation title
            navigationItem.title = sort.description
            // Create `Sorter` that will manage visualization data
            sorter = Sorter(with: sort, max: numberOfItemsToSort)
        }
    }
}

