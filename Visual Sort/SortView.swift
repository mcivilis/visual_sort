//
//  SortView.swift
//  Visual Sort
//
//  Created by Maria Civilis on 2018-09-03.
//  Copyright © 2018 Maria Civilis. All rights reserved.
//

import UIKit

protocol SortViewDelegate {
    func next()
    func finished()
}

class SortView: UIStackView {
    private var sortViewDelegate: SortViewDelegate?
    private var steps: [(Int, Int)] = []
    private var stepCounter: Int = 0
    
    func configure(with type: SortType, max: Int, delegate: SortViewDelegate) {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        stepCounter = 0
        sortViewDelegate = delegate
        let numbers = shuffled(with: max)
        steps = configureSteps(with: type, numbers: numbers)
        
        let width = frame.width / CGFloat(numbers.count)
        let max = Double(numbers.max()!)
        for number in numbers {
            let fillPercent = Double(number) / max
            let size = CGSize(width: width, height: frame.height)
            let barView = BarView(fillPercent: fillPercent, frame: CGRect(origin: .zero, size: size))
            addArrangedSubview(barView)
        }
        self.axis = .horizontal
        self.alignment = .bottom
        self.distribution = .equalCentering
        self.spacing = 0.0
    }
    
    func sort() {
        if steps.count == 0 {
            sortViewDelegate?.finished()
            return
        }
        UIView.animate(withDuration: 1, animations: { [weak self] in
        guard let weakself = self else { return }
        let step = weakself.steps[weakself.stepCounter]
        weakself.moveBarView(from: step.0, to: step.1)
        weakself.layoutSubviews()
        }) { [weak self] (finished) in
            guard let weakself = self else { return }
            weakself.stepCounter += 1
            if weakself.stepCounter == weakself.steps.count {
                weakself.sortViewDelegate?.finished()
            } else {
                weakself.sortViewDelegate?.next()
            }
        }
    }
}
// MARK: Helpers
private extension SortView {
    func shuffled(with max: Int) -> [Int] {
        var numbers = Array(1...max)
        var shuffled = [Int]()
        for _ in 0..<numbers.count {
            let randomPosition = Int(arc4random_uniform(UInt32(numbers.count)))
            shuffled.append(numbers[randomPosition])
            numbers.remove(at: randomPosition)
        }
        return shuffled
    }
    func configureSteps(with type: SortType, numbers: [Int]) -> [(Int, Int)] {
        switch type {
        case .insertion:
            return numbers.insertionSortSteps()
        default:
            return numbers.insertionSortSteps()
        }
    }
    func moveBarView(from fromIndex: Int, to toIndex: Int) {
        let viewToMove = arrangedSubviews[fromIndex]
        removeArrangedSubview(viewToMove)
        insertArrangedSubview(viewToMove, at: toIndex)
    }
}
