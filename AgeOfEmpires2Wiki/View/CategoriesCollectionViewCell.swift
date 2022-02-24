//
//  CategoriesCollectionViewCell.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 11.02.2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell, UIPointerInteractionDelegate {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.text = "Test"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(categoryLabel)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(){
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryLabel.text = ""
    }
    
    func configureCell(categoryName: String){
        categoryLabel.text = categoryName
    }
    
}
