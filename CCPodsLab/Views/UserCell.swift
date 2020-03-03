//
//  UserCell.swift
//  CCPodsLab
//
//  Created by Juan Ceballos on 3/3/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import SnapKit

class UserCell: UITableViewCell {
    
    private lazy var userNameLabel: UILabel =   {
        let label = UILabel()
        label.text = "Hey"
        return label
    }()
    
    private lazy var userEmailLabel: UILabel =  {
        let label = UILabel()
        label.text = "Ya"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public func configureCell(user: User)    {
        userNameLabel.text = user.name.first
        userEmailLabel.text = user.email
    }
    
    private func commonInit()   {
        setupUserNameLabelConstraint()
        setupUserEmailLabelConstraint()
    }
    
    private func setupUserNameLabelConstraint() {
        addSubview(userNameLabel)
        
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(8)
            make.leading.equalTo(self).offset(8)
        }
    }
    
    private func setupUserEmailLabelConstraint()    {
        addSubview(userEmailLabel)
        
        userEmailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(self).offset(8)
        }
    }
    
}



