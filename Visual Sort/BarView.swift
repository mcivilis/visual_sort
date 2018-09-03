//
//  BarView.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import UIKit

class BarView: UIStackView {
    var fillPercent: Double? {
        didSet {
            guard let fillPercent = fillPercent,
                let topHeightConstraint = topHeightConstraint,
                let bottomHeightConstraint = bottomHeightConstraint else { return }
            topHeightConstraint.constant = frame.height * (1 - CGFloat(fillPercent))
            bottomHeightConstraint.constant = frame.height * CGFloat(fillPercent)
            layoutIfNeeded()
        }
    }
    private var topHeightConstraint: NSLayoutConstraint?
    private var bottomHeightConstraint: NSLayoutConstraint?
    
    init(fillPercent: Double, frame: CGRect) {
        
        // Create top portion of the bar
        let top = UIView(frame: .zero)
        topHeightConstraint = top.heightAnchor.constraint(equalToConstant: frame.height * (1 - CGFloat(fillPercent)))
        if let topHeightConstraint = topHeightConstraint {
            topHeightConstraint.isActive = true
        }
        top.widthAnchor.constraint(equalToConstant: CGFloat(frame.width)).isActive = true
        top.backgroundColor = .white
        
        // Create bottom portion of the bar
        let bottom = UIView(frame: .zero)
        bottomHeightConstraint = bottom.heightAnchor.constraint(equalToConstant: frame.height * CGFloat(fillPercent))
        if let bottomHeightConstraint = bottomHeightConstraint {
            bottomHeightConstraint.isActive = true
        }
        bottom.widthAnchor.constraint(equalToConstant: CGFloat(frame.width)).isActive = true
        bottom.backgroundColor = .darkGray
        bottom.layer.borderWidth = 1
        bottom.layer.borderColor = UIColor.white.cgColor
    
        self.fillPercent = fillPercent
        super.init(frame: frame)
        self.addArrangedSubview(top)
        self.addArrangedSubview(bottom)
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .equalCentering
        self.spacing = 0.0
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
