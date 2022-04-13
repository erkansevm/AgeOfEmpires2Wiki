//
//  TechDetail2ViewController.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 11.04.2022.
//

import UIKit

class TechDetail2ViewController: UIViewController {
    
    var tech: Tech?
    var unit: Unit?
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = tech?.name ?? "No Data"
        setupCollectionView()
    }
    
    func fetchUnit() {
        guard let tech = tech,
              let urlString = tech.appliesTo?[0] else {
            return
        }
        
        print(urlString)
        NetworkManager.shared.getUnit(with: urlString) {[weak self] result in
            switch result {
            case .success(let unit):
                self?.unit = unit
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func goToUnitView(){
        guard let unit = unit else {
            return
        }
        
        let vc = UnitDetailViewController()
        vc.unit = unit
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Compositional + Collection View Conf
extension TechDetail2ViewController {
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env in
            switch sectionIndex {
            case 1:
                return self.createBottomSection()
            default:
                return self.createTopSection()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    func createTopSection() -> NSCollectionLayoutSection {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: layoutSize)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let section = NSCollectionLayoutSection(group: layoutGroup)
        return section
    }
    
    func createBottomSection() -> NSCollectionLayoutSection {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: layoutSize)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(450))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let section = NSCollectionLayoutSection(group: layoutGroup)
        return section
    }
    
    func setupCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TechDetailTopCell.self, forCellWithReuseIdentifier: TechDetailTopCell.identifier)
        collectionView.register(TechDetailBottomCell.self, forCellWithReuseIdentifier: TechDetailBottomCell.identifier)

        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 16, bottom: 0, right: 16))
    }
}

extension TechDetail2ViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tech = tech else {
            print("No Tech")
            return UICollectionViewCell()
        }
        switch indexPath.section {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TechDetailBottomCell.identifier, for: indexPath) as! TechDetailBottomCell
            cell.configure(with: tech)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TechDetailTopCell.identifier, for: indexPath) as! TechDetailTopCell
            cell.configure(with: tech)
            return cell
        }
    }
    
    
}
