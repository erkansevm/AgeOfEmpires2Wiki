//
//  DetailHeader.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 6.03.2022.
//

import UIKit

class DetailHeader: UITableViewHeaderFooterView {
    
    static let identifier = "DetailHeader"
    
    private let civNameLabel: UILabel = {
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
    
    private let armyTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 21, weight: .bold)
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 12
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.backgroundColor = .white
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let uniqueUnitLink: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Unique Unit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)

        return button
    }()
    private let uniqueTechLink: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Unique Tech", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)

        return button
    }()
    
    private let teamBonus: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 12
        lbl.numberOfLines = 0
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.backgroundColor = .systemGreen
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let uniquesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(civNameLabel)
        contentView.addSubview(expansionLabel)
        contentView.addSubview(armyTypeLabel)
        contentView.addSubview(teamBonus)
        contentView.addSubview(uniquesStackView)
        uniquesStackView.addArrangedSubview(uniqueTechLink)
        uniquesStackView.addArrangedSubview(uniqueUnitLink)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .clear
        configure()
    }
    
    private func configure(){
        civNameLabel.anchor(top: contentView.topAnchor, bottom: nil, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))        
        expansionLabel.anchor(top: civNameLabel.bottomAnchor, bottom: nil, leading: civNameLabel.leadingAnchor, trailing: civNameLabel.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        armyTypeLabel.anchor(top: expansionLabel.bottomAnchor, bottom: nil, leading: expansionLabel.leadingAnchor, trailing: expansionLabel.trailingAnchor ,padding: .init(top: 16, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 0, height: 70))
        teamBonus.anchor(top: armyTypeLabel.bottomAnchor, bottom: nil, leading: armyTypeLabel.leadingAnchor, trailing: armyTypeLabel.trailingAnchor ,padding: .init(top: 16, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 0, height: 70))
        uniquesStackView.anchor(top: teamBonus.bottomAnchor, bottom: nil, leading: teamBonus.leadingAnchor, trailing: teamBonus.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 70))
    }
    
    func setupCivData(civ: Civilization){
        civNameLabel.text = civ.name
        expansionLabel.text = civ.expansion
        armyTypeLabel.text = civ.army_type
        teamBonus.text = civ.team_bonus
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
