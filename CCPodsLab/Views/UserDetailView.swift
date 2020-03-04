//
//  UserDetailView.swift
//  CCPodsLab
//
//  Created by Juan Ceballos on 3/3/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import SnapKit

class UserDetailView: UIView {
    
    public lazy var fullAdressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.text = "really long address example\nsecond part here"
        return label
    }()
    
    public lazy var dobLabel: UILabel =    {
        let label = UILabel()
        label.text = "dateOfBirth"
        return label
    }()
    
    public lazy var phoneLabel: UILabel =  {
        let label = UILabel()
        label.text = "555-555-5555"
        return label
    }()
    
    private lazy var userInfoStackView: UIStackView =   {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(fullAdressLabel)
        stackView.addArrangedSubview(dobLabel)
        stackView.addArrangedSubview(phoneLabel)
        return stackView
    }()

    override init(frame: CGRect)    {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder)  {
        super.init(coder: coder)
        commonInit()
    }
    
    public func configureUI(user: User)    {
        fullAdressLabel.text = "Address:\n\(user.location.city), \(user.location.state)\n\(user.location.street), \(user.location.postcode)"
        
        let arrDOB = user.dob.date.components(separatedBy: "T")
        
        dobLabel.text = "DoB: \(arrDOB[0])"
        
        phoneLabel.text = "Phone Number: \(user.phone)"
    }
    
    private func commonInit()   {
        setupUserInfoStackViewConstraints()
    }
    
    private func setupUserInfoStackViewConstraints()    {
        addSubview(userInfoStackView)
        userInfoStackView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.2)
            make.centerY.equalTo(snp.centerY)
        }
    }
}


