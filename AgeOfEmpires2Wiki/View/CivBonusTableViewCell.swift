//
//  CivBonusTableViewCell.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 3.03.2022.
//

import UIKit

class CivBonusTableViewCell: UITableViewCell {
    static let identifier = "CivBonusTableViewCell"
    
    private let civBonusLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 12
        lbl.numberOfLines = 0
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.backgroundColor = .systemBlue
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
    
    override func layoutSubviews() {
        contentView.addSubview(civBonusLabel)
        civBonusLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 0))
    }
    
    func configure(bonusText: String){
        civBonusLabel.text = bonusText
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
