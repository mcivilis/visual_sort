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
            let max = numers.max()!
            for number in numers {
                
                let bottom = UIView(frame: .zero)
                let bottomHeight = frame.height / CGFloat(max) * CGFloat(number)
                bottom.heightAnchor.constraint(equalToConstant: bottomHeight).isActive = true
                bottom.widthAnchor.constraint(equalToConstant: width).isActive = true
                bottom.backgroundColor = .darkGray
                bottom.layer.borderWidth = 1
                bottom.layer.borderColor = UIColor.white.cgColor
                
                let top = UIView(frame: .zero)
                let topHeight = frame.height - bottomHeight
                top.heightAnchor.constraint(equalToConstant: topHeight).isActive = true
                top.widthAnchor.constraint(equalToConstant: width).isActive = true
                top.backgroundColor = .white
                
                let stackView = UIStackView(arrangedSubviews: [top, bottom])
                stackView.axis = .vertical
                stackView.alignment = .center
                stackView.distribution = .equalCentering
                stackView.spacing = 0.0
                
                addArrangedSubview(stackView)
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
