//
//  BarView.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import UIKit

class BarView: UIStackView {
    var fillPercent: Double?
    
    private let bottom = UIView(frame: .zero)
    
    init(fillPercent: Double, frame: CGRect, width: CGFloat) {
        
        // Create top portion of the bar
        let top = UIView(frame: .zero)
        top.heightAnchor.constraint(equalToConstant: frame.height * (1 - CGFloat(fillPercent))).isActive = true
        top.widthAnchor.constraint(equalToConstant: width).isActive = true
        top.backgroundColor = .white
        
        // Create bottom portion of the bar
        bottom.heightAnchor.constraint(equalToConstant: frame.height * CGFloat(fillPercent)).isActive = true
        bottom.widthAnchor.constraint(equalToConstant: width).isActive = true
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
    func highlight() {
        bottom.backgroundColor = .blue
    }
}
