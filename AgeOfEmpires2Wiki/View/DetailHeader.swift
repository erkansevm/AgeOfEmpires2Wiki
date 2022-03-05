//
//  DetailHeader.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 6.03.2022.
//

import UIKit

class DetailHeader: UITableViewHeaderFooterView {
    
    static let identifier = "DetailHeader"
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
