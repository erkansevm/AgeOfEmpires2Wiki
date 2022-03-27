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
//        stackView.spacing = 4
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
    
    private let ageLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = .systemRed
        lbl.layer.cornerRadius = 12
        lbl.layer.borderWidth = 1
        lbl.clipsToBounds = true
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        
        return lbl
    }()
    
    let createdInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Creatid in 👆🏻", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        return button
    }()
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 28
        return stackView
    }()
    
    private let costContainerView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .white
        vw.layer.borderWidth = 1
        vw.layer.borderColor = UIColor.black.cgColor
        vw.layer.cornerRadius = 12
        vw.clipsToBounds = true
        return vw
    }()
    
    private let costStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 10
       
        return stackView
    }()
    
    private let goldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 2
        return stackView
    }()
    
    private let foodStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 2
        return stackView
    }()
    
    private let stoneStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 2
        return stackView
    }()
    
    private let woodStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
//        stackView.spacing = 2
        return stackView
    }()
    
    private let woodImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "wood"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let woodCostLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGreen
        lbl.textAlignment = .center
        lbl.clipsToBounds = true
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.text = ": 0"
        return lbl
    }()
    
    private let foodImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "food"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let foodCostLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGreen
        lbl.textAlignment = .center
        lbl.clipsToBounds = true
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.text = ": 0"
        return lbl
    }()
    
    private let goldImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "gold"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let goldCostLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGreen
        lbl.textAlignment = .center
        lbl.clipsToBounds = true
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.text = ": 0"
        return lbl
    }()
    
    private let stoneImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "stone"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let stoneCostLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGreen
        lbl.textAlignment = .center
        lbl.clipsToBounds = true
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.text = ": 0"
        return lbl
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(unitNameLabel)
        contentView.addSubview(expansionLabel)
        contentView.addSubview(aboutStackView)
        contentView.addSubview(containerStackView)
        contentView.addSubview(costContainerView)
        costContainerView.addSubview(costStackView)
        aboutStackView.addArrangedSubview(descriptionTitle)
        aboutStackView.addArrangedSubview(descriptionLabel)
        
        containerStackView.addArrangedSubview(ageLabel)
        containerStackView.addArrangedSubview(createdInButton)
        
        costStackView.addArrangedSubview(goldStackView)
        costStackView.addArrangedSubview(woodStackView)
        costStackView.addArrangedSubview(stoneStackView)
        costStackView.addArrangedSubview(foodStackView)
        
        woodStackView.addArrangedSubview(woodImage)
        woodStackView.addArrangedSubview(woodCostLabel)
        
        foodStackView.addArrangedSubview(foodImage)
        foodStackView.addArrangedSubview(foodCostLabel)
        
        goldStackView.addArrangedSubview(goldImage)
        goldStackView.addArrangedSubview(goldCostLabel)
        
        stoneStackView.addArrangedSubview(stoneImage)
        stoneStackView.addArrangedSubview(stoneCostLabel)
     
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        setSpacingOfStackViews()
    }
    
    func setupConstraints(){
        unitNameLabel.anchor(top: contentView.topAnchor, bottom: nil, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        expansionLabel.anchor(top: unitNameLabel.bottomAnchor, bottom: nil, leading: unitNameLabel.leadingAnchor, trailing: unitNameLabel.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        aboutStackView.anchor(top: expansionLabel.bottomAnchor, bottom: nil, leading: expansionLabel.leadingAnchor, trailing: expansionLabel.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        containerStackView.anchor(top: aboutStackView.bottomAnchor, bottom: nil, leading: aboutStackView.leadingAnchor, trailing: aboutStackView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 60))
        costContainerView.anchor(top: nil, bottom: contentView.bottomAnchor, leading: containerStackView.leadingAnchor, trailing: containerStackView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 0), size: CGSize(width: 0, height: 60))
        costStackView.anchor(top: costContainerView.topAnchor, bottom: costContainerView.bottomAnchor, leading: costContainerView.leadingAnchor, trailing: costContainerView.trailingAnchor, padding: .init(top: 5, left: 15, bottom: 5, right: 15))

    }
    
    func setSpacingOfStackViews(){
        aboutStackView.spacing = 4
        containerStackView.spacing = 28
        costStackView.spacing = 10
        goldStackView.spacing = 2
        foodStackView.spacing = 2
        stoneStackView.spacing = 2
        woodStackView.spacing = 2
    }
    
    func configure(with unit: Unit){
        unitNameLabel.text = unit.name
        expansionLabel.text = unit.expansion
        descriptionLabel.text = unit.description
        ageLabel.text = "Age → \(unit.age)"
        if  unit.cost.wood != nil {
            woodCostLabel.text = ":\(unit.cost.wood!)"
            woodCostLabel.textColor = .systemRed
        }
        
        if  unit.cost.gold != nil {
            goldCostLabel.text = ":\(unit.cost.gold!)"
            goldCostLabel.textColor = .systemRed
        }
        
        if  unit.cost.stone != nil {
            stoneCostLabel.text = ":\(unit.cost.stone!)"
            stoneCostLabel.textColor = .systemRed
        }
    
        if  unit.cost.food != nil {
            foodCostLabel.text = ":\(unit.cost.food!)"
            foodCostLabel.textColor = .systemRed
        }
        
    
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
