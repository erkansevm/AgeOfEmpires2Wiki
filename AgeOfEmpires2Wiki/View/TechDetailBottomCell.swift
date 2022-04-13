//
//  TechDetailBottomCell.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 12.04.2022.
//

import UIKit

class TechDetailBottomCell: UICollectionViewCell {
    static let identifier = "TechDetailBottomCell"

    let age = UILabel()
    let buildTime = UILabel()
    let descriptionText = BonusLabel(frame: .zero)
    let costs = CostView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    
    func setupCell(){
        descriptionText.setContentHuggingPriority(.defaultHigh, for: .vertical)
        age.font = .systemFont(ofSize: 21, weight: .medium)
        age.textColor = .systemRed
        age.backgroundColor = .systemBackground
        age.text = "Age 🗓:"
        age.setContentHuggingPriority(.defaultHigh, for: .vertical)

        let developesInRow = GotoFeatureRow()
        developesInRow.configureLabel(text: "Developes in 👷🏻‍♂️")
        let appliesToRow = GotoFeatureRow()
        appliesToRow.configureLabel(textColor: .systemBlue, text: "Applies to 🖇:")
        appliesToRow.configureButton(titleColor: .systemBlue)
        
        
        buildTime.font = .systemFont(ofSize: 21, weight: .medium)
        buildTime.textColor = .systemIndigo
        buildTime.text = "Build time ⏰:"
        buildTime.setContentHuggingPriority(.defaultHigh, for: .vertical)

        let innerStackView = UIStackView(arrangedSubviews: [descriptionText,age,buildTime,developesInRow,appliesToRow])
        
        innerStackView.axis = .vertical
        innerStackView.alignment = .leading
        innerStackView.spacing = 20
        costs.setContentHuggingPriority(.defaultHigh, for: .vertical)
        let stackView = UIStackView(arrangedSubviews: [innerStackView, costs])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        addSubview(stackView)
        stackView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
    }
    

    
    func configure(with tech: Tech){
        descriptionText.text = descriptionText.text! + tech.description
        age.text = "\(age.text!)  \(tech.age)"
        let buildTimeText = tech.buildTime == nil ? "No Data" : "\(tech.buildTime!)"
        buildTime.text = "\(buildTime.text!)  \(buildTimeText)"
        costs.configure(gold: tech.cost.gold ?? 0, wood: tech.cost.wood ?? 0, food: tech.cost.food ?? 0, stone: tech.cost.stone ?? 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
