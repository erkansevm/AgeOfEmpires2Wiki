//
//  FeatureRow.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 13.04.2022.
//

import UIKit

class GotoFeatureRow: UIView {
    
    let label = UILabel()
    let button = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        configureLabel(text: nil)
        configureButton()
        button.backgroundColor = backgroundColor
        
        let rowStackView = UIStackView(arrangedSubviews: [label, button])
        rowStackView.axis = .horizontal
        rowStackView.spacing = 12
        rowStackView.alignment = .center
        rowStackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.addSubview(rowStackView)
        rowStackView.fillSuperView()
    }
    
    
    func configureButton(title: String = "Go to ⤴",
                         fontSize: CGFloat=21,
                         weight: UIFont.Weight = .medium,
                         titleColor: UIColor = .systemOrange)
    {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: weight)
        button.setTitleColor(titleColor, for: .normal)
        button.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, size: .init(width: 100, height: 40))
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = titleColor.cgColor
    }
    
    func configureLabel(fontSize: CGFloat = 21,
                        weight: UIFont.Weight = .medium,
                        textColor: UIColor = .systemOrange, text: String?)
    {
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        label.textColor = textColor
        label.text = text ?? "No Text"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
