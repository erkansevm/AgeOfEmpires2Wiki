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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "deneme")
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deneme", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  view.frame.size.height / 2.5
    }
    
}
