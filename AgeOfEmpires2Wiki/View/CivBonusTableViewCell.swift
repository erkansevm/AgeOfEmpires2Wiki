//
//  CivBonusTableViewCell.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 3.03.2022.
//

import UIKit

class CivBonusTableViewCell: UITableViewCell {
    static let identifier = "CivBonusTableViewCell"
    
    
    //MARK: - UI
    private let containerView: UIView = {
        let vw = UIView()
        vw.clipsToBounds = true
        vw.layer.cornerRadius = 12
        vw.layer.borderWidth = 1
        vw.layer.borderColor = UIColor.black.cgColor
        return vw
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let civBonusLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
//        lbl.clipsToBounds = true
//        lbl.layer.cornerRadius = 12
//        lbl.layer.borderWidth = 1
//        lbl.layer.borderColor = UIColor.black.cgColor
//        lbl.backgroundColor = .systemBlue
        return lbl
    }()
    
    func configure(){
        containerView.backgroundColor = .systemBlue
        contentView.addSubview(containerView)
        containerView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(civBonusLabel)
        containerView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor,padding: .init(top: 8, left: 0, bottom: 8, right: 0))
        contentStackView.anchor(top: containerView.topAnchor, bottom: containerView.bottomAnchor, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    func configureLabelText(bonusText: String){
        
        civBonusLabel.text = bonusText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
