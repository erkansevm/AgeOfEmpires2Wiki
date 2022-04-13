//
//  NameAndExpansionView.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 13.04.2022.
//

import UIKit

class NameAndExpansionView: UIView {
    
    let name = UILabel()
    let expansion = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    
    func setupLabels(){
        name.font = .systemFont(ofSize: 40, weight: .bold)
        name.textColor = .label
        name.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        expansion.font = .systemFont(ofSize: 32, weight: .bold)
        expansion.textColor = .secondaryLabel
        expansion.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        let tempView = UIView()
        let lineView = UIView()
        tempView.addSubview(lineView)
        lineView.anchor(top: nil, bottom: nil, leading: tempView.leadingAnchor, trailing: tempView.trailingAnchor, size: CGSize(width: 0, height: 3))
        lineView.centerYAnchor.constraint(equalTo: tempView.centerYAnchor).isActive = true
        lineView.backgroundColor = .systemGray6
        let stackView = UIStackView(arrangedSubviews: [name,expansion,tempView])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.fillSuperView()
        stackView.spacing = 8
    }
    
    func configure(with: ModelGeneral){
        name.text = with.name
        expansion.text = with.expansion
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
