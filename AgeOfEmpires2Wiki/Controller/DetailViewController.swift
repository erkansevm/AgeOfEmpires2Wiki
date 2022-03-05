//
//  DetailViewController.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 2.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var civ: Civilization?
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
        table.register(CivBonusTableViewCell.self, forCellReuseIdentifier: CivBonusTableViewCell.identifier)
        return table
    }()
    
    private let civNameLabel: UILabel = {
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
    
    private let armyTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 21, weight: .bold)
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 12
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.backgroundColor = .white
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let uniqueUnitLink: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Unique Unit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)

        return button
    }()
    private let uniqueTechLink: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Unique Tech", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)

        return button
    }()
    
    private let teamBonus: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 12
        lbl.numberOfLines = 0
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.backgroundColor = .systemGreen
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let uniquesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = UIColor(named: "background")
        tableView.backgroundColor = view.backgroundColor
        setupViews()
        configureCivDetails()
        configureTableView()
        
    }
    
    
    func configureCivDetails() {
        guard let civ = civ else  {
            print("no civ data")
            return
        }
        civNameLabel.text = civ.name
        expansionLabel.text = civ.expansion
        armyTypeLabel.text = "Army Type: \(civ.army_type)"
        teamBonus.text = "Team Bonus: \(civ.team_bonus)"
        
    }
  
    func setupViews(){
        view.addSubview(civNameLabel)
        view.addSubview(expansionLabel)
        view.addSubview(armyTypeLabel)
        view.addSubview(teamBonus)
        view.addSubview(tableView)
        view.addSubview(uniquesStackView)
        uniquesStackView.addArrangedSubview(uniqueTechLink)
        uniquesStackView.addArrangedSubview(uniqueUnitLink)
        
        civNameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 16, bottom: 0, right: 16))
//        civNameLabel.backgroundColor = .red
        
        expansionLabel.anchor(top: civNameLabel.bottomAnchor, bottom: nil, leading: civNameLabel.leadingAnchor, trailing: civNameLabel.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        armyTypeLabel.anchor(top: expansionLabel.bottomAnchor, bottom: nil, leading: expansionLabel.leadingAnchor, trailing: expansionLabel.trailingAnchor ,padding: .init(top: 16, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 0, height: 70))
        teamBonus.anchor(top: armyTypeLabel.bottomAnchor, bottom: nil, leading: armyTypeLabel.leadingAnchor, trailing: armyTypeLabel.trailingAnchor ,padding: .init(top: 16, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 0, height: 70))
        uniquesStackView.anchor(top: teamBonus.bottomAnchor, bottom: nil, leading: teamBonus.leadingAnchor, trailing: teamBonus.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 70))
  
    }


    func configureTableView(){
        tableView.anchor(top: uniquesStackView.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: uniquesStackView.leadingAnchor, trailing: uniquesStackView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }

}




extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let civ = civ else {
            return 1
        }
        return civ.civilization_bonus.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CivBonusTableViewCell.identifier,for: indexPath) as! CivBonusTableViewCell
        cell.configure()
        guard let civ = civ else {
            cell.configureLabelText(bonusText: "No Data")
            return cell
        }
        cell.configureLabelText(bonusText: civ.civilization_bonus[indexPath.row])
        return cell
    }
    

}
