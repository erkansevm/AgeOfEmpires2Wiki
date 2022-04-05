//
//  TechDetailViewController.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 27.03.2022.
//

import UIKit

class TechDetailViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.register(UnitDetailTableViewCell.self, forCellReuseIdentifier: UnitDetailTableViewCell.identifier)
        tableView.register(TechDetailHeader.self, forHeaderFooterViewReuseIdentifier: TechDetailHeader.identifier)
        return tableView
    }()
    
    var tech: Tech?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = UIColor(named: "background")
        title = tech?.name ?? "No Data"
        tableView.dataSource = self
        tableView.delegate = self
        configureTableView()
    }
    
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 40, left: 16, bottom: 0, right: 16))
    }

}


extension TechDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TechDetailHeader.identifier) as! TechDetailHeader
        guard let tech = tech else {
            return nil
        }
        header.configure(with: tech)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.size.height / 2.5
    }
    
}
