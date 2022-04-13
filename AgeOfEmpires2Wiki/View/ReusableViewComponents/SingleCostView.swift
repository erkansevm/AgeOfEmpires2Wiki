//
//  SingleCostView.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 14.04.2022.
//

import UIKit

class SingleCostView: UIView {

    let imageView = UIImageView()
    let cost = UILabel()
    
     init(frame: CGRect, imageName: String) {
        super.init(frame: frame)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, size: CGSize(width: 50, height: 0))
        
        cost.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, cost])
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperView()
        stackView.spacing = 8
    }
    
    func configure(amount: Int){
        cost.text = "\(amount)"
        cost.textColor = amount == 0 ? .systemGreen : .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
