//
//  BonusLabel.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 13.04.2022.
//
import UIKit

class BonusLabel: UILabel {
    
    
    init(frame: CGRect,
         fontSize: CGFloat=21,
         weight: UIFont.Weight = .bold,
         textColor: UIColor = .systemGreen
         ) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
        self.text = "Bonus: "
        self.numberOfLines = 0
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
