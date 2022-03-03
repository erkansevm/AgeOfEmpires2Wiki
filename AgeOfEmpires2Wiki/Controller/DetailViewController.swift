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
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CivBonusTableViewCell.self, forCellReuseIdentifier: CivBonusTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = UIColor(named: "background")
        tableView.backgroundColor = view.backgroundColor
        setupViews()
        configureCivDetails()
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        
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
        civNameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 16, bottom: 0, right: 16))
//        civNameLabel.backgroundColor = .red
        
        expansionLabel.anchor(top: civNameLabel.bottomAnchor, bottom: nil, leading: civNameLabel.leadingAnchor, trailing: civNameLabel.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        armyTypeLabel.anchor(top: expansionLabel.bottomAnchor, bottom: nil, leading: expansionLabel.leadingAnchor, trailing: expansionLabel.trailingAnchor ,padding: .init(top: 16, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 0, height: 70))
        teamBonus.anchor(top: armyTypeLabel.bottomAnchor, bottom: nil, leading: armyTypeLabel.leadingAnchor, trailing: armyTypeLabel.trailingAnchor ,padding: .init(top: 16, left: 0, bottom: 0, right: 0) ,size: CGSize(width: 0, height: 70))
        tableView.anchor(top: teamBonus.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: teamBonus.leadingAnchor, trailing: teamBonus.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }



}




extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let civ = civ else {
            return 1
        }
        return civ.civilization_bonus.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CivBonusTableViewCell.identifier,for: indexPath) as! CivBonusTableViewCell
        guard let civ = civ else {
            cell.configure(bonusText: "No Data")
            return cell
        }
        cell.configure(bonusText: civ.civilization_bonus[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
