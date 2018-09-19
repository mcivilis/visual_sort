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
    private var width: CGFloat?
    
    func configure(with type: SortType, max: Int, delegate: SortViewDelegate) {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        stepCounter = 0
        sortViewDelegate = delegate
        let numbers = shuffled(with: max)
        steps = configureSteps(with: type, numbers: numbers)
        if width == nil {
            self.width = frame.width / CGFloat(numbers.count)
        }
        guard let width = width else { return }
        let max = Double(numbers.max()!)
        for number in numbers {
            let fillPercent = Double(number) / max
            let size = CGSize(width: width, height: frame.height)
            let barView = BarView(fillPercent: fillPercent, frame: CGRect(origin: .zero, size: size), width: width)
            addArrangedSubview(barView)
        }
        axis = .horizontal
        alignment = .bottom
        distribution = .equalCentering
        spacing = 0.0
    }
    
    func sort() {
        if steps.count == 0 {
            sortViewDelegate?.finished()
            return
        }
        UIView.animate(withDuration: 1, animations: { [weak self] in
        guard let weakself = self else { return }
            let step = weakself.steps[weakself.stepCounter]
            weakself.swapView(at: step.0, at: step.1)
        }) { [weak self] (finished) in
            guard let weakself = self else { return }
            weakself.stepCounter += 1
            if weakself.stepCounter == weakself.steps.count {
                for view in weakself.arrangedSubviews {
                    if let barView = view as? BarView {
                        barView.highlight()
                    }
                }
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
            return SortSteps.insertionSort(for: numbers)
        case .bubble:
            return SortSteps.bubbleSort(for: numbers)
        case .selection:
            return SortSteps.selectionSort(for: numbers)
        case .merge:
            return SortSteps.insertionSort(for: numbers) //TODO
        }
    }
    func swapView(at swapIndex1: Int, at swapIndex2: Int) {
        let view1 = arrangedSubviews[swapIndex1]
        let view2 = arrangedSubviews[swapIndex2]
        if let barView = view2 as? BarView {
            barView.highlight()
        }
        if swapIndex2 > swapIndex1 {
            removeArrangedSubview(view2)
            removeArrangedSubview(view1)
            insertArrangedSubview(view2, at: swapIndex1)
            insertArrangedSubview(view1, at: swapIndex2)
        } else {
            removeArrangedSubview(view1)
            removeArrangedSubview(view2)
            insertArrangedSubview(view1, at: swapIndex2)
            insertArrangedSubview(view2, at: swapIndex1)
        }
        layoutIfNeeded()
    }
}
