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
        let table = UITableView(frame: .zero, style: .grouped)
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
        table.register(CivBonusTableViewCell.self, forCellReuseIdentifier: CivBonusTableViewCell.identifier)
        table.register(DetailHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        
        return table
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = UIColor(named: "background")
        configureTableView()
        
    }

    func configureTableView(){
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 16, bottom: 0, right: 16))
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
        header.setupCivData(civ: civ)
        return header
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.size.height / 2.5
    }
    

}
