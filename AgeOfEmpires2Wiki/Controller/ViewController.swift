//
//  ViewController.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 11.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let categories = [
        "Civilizations",
        "Units",
        "Structures",
        "Technologies"
    ]
    
    private let collectionView: UICollectionView = {
        let myCollectionView =  UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return myCollectionView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome 👋🏻"
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.textColor = .label
        return label
    }()

    private let descpLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover Age of Empires 2"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        
//        stackView.backgroundColor = .purple
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setupCollectionView()
        setupNavigationBar()
        setupStackViewSection()
    }
    
    func setupStackViewSection(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(descpLabel)
    }
    
    func setupNavigationBar(){
        let titleLabel = UILabel()
        titleLabel.text = "AOE2Wiki"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let logoView = UIImageView()
        logoView.image = UIImage(named: "logo")
        logoView.contentMode = .scaleAspectFit
        logoView.layer.cornerRadius = logoView.frame.size.width / 2
        logoView.clipsToBounds = true
        logoView.layer.masksToBounds = true
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 40))
        
        titleView.addSubview(titleLabel)
        titleView.addSubview(logoView)
        
        NSLayoutConstraint.activate([
            logoView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            logoView.topAnchor.constraint(equalTo: titleView.topAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 40),
            logoView.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: logoView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: logoView.bottomAnchor),
            
        ])
        navigationItem.titleView = titleView
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(named: "background")
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
        let categoryName = categories[indexPath.row]
        cell.configureCell(categoryName: categoryName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width / 2) - 10,
                      height: (collectionView.frame.size.width / 2) - 10 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = ItemsViewController()
        vc.titleString = categories[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
}

