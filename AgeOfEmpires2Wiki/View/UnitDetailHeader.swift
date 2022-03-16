//
//  UnitDetailHeader.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 14.03.2022.
//

import UIKit

class UnitDetailHeader: UITableViewHeaderFooterView {
    
    static let identifier = "UnitDetailHeader"

    private let unitNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 40, weight: .bold)
        return lbl
    }()
    private let expansionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 32, weight: .bold)
        return lbl
    }()
    
    
    
    private let aboutStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
//        stackView.clipsToBounds = true
//        stackView.layer.cornerRadius = 12
//        stackView.layer.borderWidth = 1
//        stackView.layer.borderColor = UIColor.black.cgColor
//        stackView.backgroundColor = .white
        return stackView
    }()
    
    private let descriptionTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 17, weight: .medium)
        lbl.text = "About:"
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.numberOfLines = 0
//        lbl.clipsToBounds = true
//        lbl.layer.cornerRadius = 12
//        lbl.layer.borderWidth = 1
//        lbl.layer.borderColor = UIColor.black.cgColor
//        lbl.backgroundColor = .white
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(unitNameLabel)
        contentView.addSubview(expansionLabel)
        contentView.addSubview(aboutStackView)
        aboutStackView.addArrangedSubview(descriptionTitle)
        aboutStackView.addArrangedSubview(descriptionLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func setupConstraints(){
        unitNameLabel.anchor(top: contentView.topAnchor, bottom: nil, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        expansionLabel.anchor(top: unitNameLabel.bottomAnchor, bottom: nil, leading: unitNameLabel.leadingAnchor, trailing: unitNameLabel.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        aboutStackView.anchor(top: expansionLabel.bottomAnchor, bottom: nil, leading: expansionLabel.leadingAnchor, trailing: expansionLabel.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    func configure(with unit: Unit){
        unitNameLabel.text = unit.name
        expansionLabel.text = unit.expansion
        descriptionLabel.text = unit.description
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
