//
//  DetailViewController.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 2.03.2022.
//

import UIKit

class CivDetailViewController: UIViewController {
    
    var civ: Civilization?
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
        table.register(CivBonusTableViewCell.self, forCellReuseIdentifier: CivBonusTableViewCell.identifier)    
        table.register(DetailHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        
        return table
    }()
    
    var uniqueUnit: Unit?
    var uniqueTech: Tech?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = UIColor(named: "background")
        configureTableView()
        fetchUnit()
        fetchTech()
        print("annen")
        
    }
    
    func fetchUnit(){
        guard let civ = civ else {
            return
        }
        let urlString = civ.unique_unit[0]
        NetworkManager.shared.getUnit(with: urlString) { [weak self]result in
            switch result {
            case .success( let data):
                self?.uniqueUnit = data
            case .failure( let error):
                print(error)
            }
        }
    }

    func fetchTech() {
        guard let civ = civ else {
            return
        }
        let urlString = civ.unique_tech[0]
        NetworkManager.shared.getTech(with: urlString) { [weak self]result in
            switch result {
            case .success( let data):
                print(data)
                self?.uniqueTech = data
            case .failure( let error):
                print(error)
            }
        }
    }
    @objc func goToUniqueUnitView(){
        guard let unit = uniqueUnit else {
            return
        }
        let vc = UnitDetailViewController()
        vc.unit = unit
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToUniqueTechView(){
        guard let tech = uniqueTech else {
            print("No Tech data")
            return
        }
        
        let vc = TechDetailViewController()
        vc.tech = tech
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 16, bottom: 0, right: 16))
    }

}




extension CivDetailViewController: UITableViewDelegate, UITableViewDataSource {
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
        cell.backgroundColor = .clear
        guard let civ = civ else {
            cell.configureLabelText(bonusText: "No Data")
            return cell
        }
        cell.configureLabelText(bonusText: civ.civilization_bonus[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! DetailHeader
        guard let civ = civ else {
            return header
        }
        header.uniqueUnitLink.addTarget(self, action: #selector(goToUniqueUnitView), for: .touchUpInside)
        header.uniqueTechLink.addTarget(self, action: #selector(goToUniqueTechView), for: .touchUpInside)
        header.setupCivData(civ: civ)
        return header
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.size.height / 2.5
    }
    

}
