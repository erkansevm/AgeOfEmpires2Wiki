//
//  TechDetailCell.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 11.04.2022.
//

import UIKit

class TechDetailTopCell: UICollectionViewCell {
    static let identifier = "TechDetailCell"
    
    let nameAndExpansion = NameAndExpansionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameAndExpansion)
        nameAndExpansion.fillSuperView()
    }
    
    
    func configure(with tech: Tech){
        nameAndExpansion.configure(with: tech)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
