//
//  UnitDetailTableViewCell.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 14.03.2022.
//

import UIKit

class UnitDetailTableViewCell: UITableViewCell {
    
    static let identifier = "UnitDetailTableViewCell"
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 28
        return stackView
    }()
    
     let label1: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 12
        lbl.numberOfLines = 0
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.backgroundColor = .systemGreen
        lbl.textAlignment = .center
        lbl.text = ""
        
        return lbl
    }()
    
     let label2: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 12
        lbl.numberOfLines = 0
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.backgroundColor = .systemGreen
        lbl.textAlignment = .center
        lbl.text = ""
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(label1)
        containerStackView.addArrangedSubview(label2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstaints()
    }
    
    func setupConstaints() {
        containerStackView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
