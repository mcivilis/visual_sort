//
//  SortView.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import UIKit

class SortView: UIStackView {
    var numers: [Int]? {
        didSet {
            guard let numers = numers else { return }
            let width = frame.width / CGFloat(numers.count)
            let max = Double(numers.max()!)
            for number in numers {
                let fillPercent = Double(number) / max
                let size = CGSize(width: width, height: frame.height)
                addArrangedSubview(BarView(fillPercent: fillPercent, frame: CGRect(origin: .zero, size: size)))
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.axis = .horizontal
        self.alignment = .bottom
        self.distribution = .equalCentering
        self.spacing = 0.0
    }
}
