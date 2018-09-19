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
    @IBOutlet var sortView: SortView!
    @IBOutlet var sortButton: UIButton!
    @IBOutlet var algorithmTextView: UITextView!
    
    /// `Sort` that is currently being visualized.
    var sort: Sort?
    
    /// Constant that determines the number of items to sort.
    let numberOfItemsToSort: Int = 15
    
    /// Index that keeps track of what iteration the sort is ob
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let sort = sort else { return }
        navigationItem.title = sort.description
        algorithmTextView.text = sort.algorithm
        sortView.configure(with: sort.type, max: numberOfItemsToSort, delegate: self)
    }
    
    @IBAction func sortButtonTapped(_ sortButton: UIButton) {
        guard let sort = sort else { return }
        if sortButton.titleLabel?.text == "RESET" {
            sortButton.setTitle("SORT", for: .normal)
            sortButton.setTitle("SORT", for: .selected)
            sortButton.titleLabel?.sizeToFit()
            sortView.configure(with: sort.type, max: numberOfItemsToSort, delegate: self)
        } else {
            sortView.sort()
        }
    }
}

extension SortVisualizerViewController: SortViewDelegate {
    func next() {
        sortView.sort()
    }
    
    func finished() {
        sortButton.setTitle("RESET", for: .normal)
        sortButton.setTitle("RESET", for: .selected)
        sortButton.titleLabel?.sizeToFit()
    }
}

