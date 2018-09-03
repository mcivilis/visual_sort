//
//  SortVisualizerViewController.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import UIKit

class SortVisualizerViewController: UIViewController {
    
    
    @IBOutlet var sortContainer: UIView!
    
    let itemWidth = 15.0

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = sort {
            navigationItem.title = detail.description
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    var sort: Sort? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

