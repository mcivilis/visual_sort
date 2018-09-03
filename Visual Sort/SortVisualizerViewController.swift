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
    
    /// `Sort` that is currently being visualized.
    var sort: Sort?
    
    /// `Sorter` provides visialization data.
    var sorter: Sorter?
    
    /// Constant that determines the number of items to sort.
    let numberOfItemsToSort: Int = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let sort = sort else { return }
        // Update the initial user interface for `Sort`.
        configureView(with: sort)
        // Create `Sorter` that will manage visualization data.
        sorter = Sorter(with: sort, delegate: self, max: numberOfItemsToSort)
        // Begin sorting
        sorter?.beginSort()
    }

}
/// MARK: - Helpers
extension SortVisualizerViewController {
    /// Update the initial user interface for `Sort`.
    func configureView(with sort: Sort) {
        // Set navigation title
        navigationItem.title = sort.description
    }
    /// Update view for current `Sorter` state
    func updateView() {
        // TODO
    }
}

/// MARK: - <SortDelegate>
extension SortVisualizerViewController: SortDelegate {
    func sortIsReady(with numbers: [Int]) {
        sortView.numers = numbers
    }
    func sortDidChange(with numbers: [Int]) {
        updateView()
    }
}

