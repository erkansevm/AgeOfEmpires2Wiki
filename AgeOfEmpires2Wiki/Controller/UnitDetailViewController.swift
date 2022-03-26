//
//  UnitDetailViewController.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 14.03.2022.
//

import UIKit

class UnitDetailViewController: UIViewController {
    
    var unit: Unit?
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.register(UnitDetailTableViewCell.self, forCellReuseIdentifier: UnitDetailTableViewCell.identifier)
        tableView.register(UnitDetailHeader.self, forHeaderFooterViewReuseIdentifier: UnitDetailHeader.identifier)
      
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        tableView.dataSource = self
        tableView.delegate = self
        title = unit?.name ?? "Selam"
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 16, bottom: 0, right: 16))    }
    
    
}

extension UnitDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: UnitDetailHeader.identifier) as! UnitDetailHeader
        guard let unit = unit else  {
            return header
        }
        header.configure(with: unit)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UnitDetailTableViewCell.identifier, for: indexPath) as! UnitDetailTableViewCell
        guard let unit = unit else {
            print("No Unit")
            return cell
        }
        if indexPath.row == 1 {
         
        }
        
        switch indexPath.row {
        case 0:
            if unit.buildTime != nil {
                cell.label1.text = "Build Time: \(unit.buildTime!)"
            } else {
                cell.label1.text = "Build Time: No Data"
            }
            
            if unit.reloadTime != nil {
                cell.label2.text = "Reload Time: \(unit.reloadTime!)"
            } else {
                cell.label2.text = "Build Time: No Data"
            }
        case 1:
            if unit.attackDelay != nil {
                cell.label1.text = "Attack Delay: \(unit.attackDelay!)"
            } else {
                cell.label1.text = "Attack Delay: No Data"
            }
            
            if unit.movementRate != nil {
                cell.label2.text = "Mov Rate: \(unit.movementRate!)"
            } else {
                cell.label2.text = "Mov Rate: No Data"
            }
        case 2:
            if unit.armor != nil {
                cell.label1.text = "Armor: \(unit.armor!)"
            } else {
                cell.label1.text = "Armor: No Data"
            }
            
            if unit.hitPoints != nil {
                cell.label2.text = "Hit Points: \(unit.hitPoints!)"
            } else {
                cell.label2.text = "Hit Points: No Data"
            }
        case 3:
            if unit.range != nil {
                cell.label1.text = "Range: \(unit.range!)"
            } else {
                cell.label1.text = "Range: No Data"
            }
            
            if unit.attack != nil {
                cell.label2.text = "Attack: \(unit.attack!)"
            } else {
                cell.label2.text = "Attack: No Data"
            }
        default:
            print("No index path")
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  view.frame.size.height / 2.5
    }
    
}
