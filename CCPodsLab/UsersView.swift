//
//  UsersView.swift
//  CCPodsLab
//
//  Created by Juan Ceballos on 3/3/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import SnapKit

class UsersView: UIView {

    private lazy var usersTableView: UITableView =  {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        
    }
    
    private func setupUsersTableViewConstraints()   {
        addSubview(usersTableView)
        
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
