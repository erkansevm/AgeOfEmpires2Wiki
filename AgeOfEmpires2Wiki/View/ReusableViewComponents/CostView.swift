//
//  CostView.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 14.04.2022.
//

import UIKit

class CostView: UIView {
    let goldCost  = SingleCostView(frame: .zero,imageName: "gold")
    let woodCost  = SingleCostView(frame: .zero,imageName: "wood")
    let foodCost  = SingleCostView(frame: .zero,imageName: "food")
    let stoneCost = SingleCostView(frame:.zero, imageName: "stone")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let stackView = UIStackView(arrangedSubviews: [goldCost, woodCost, foodCost, stoneCost])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.fillSuperView()
        stackView.spacing = 8
    }
    func configure(gold:Int, wood: Int, food: Int, stone: Int) {
        goldCost.configure(amount: gold)
        woodCost.configure(amount: wood)
        foodCost.configure(amount: food)
        stoneCost.configure(amount: stone)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
