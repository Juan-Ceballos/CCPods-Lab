//
//  UserDetailViewController.swift
//  CCPodsLab
//
//  Created by Juan Ceballos on 3/3/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    let userDetailView = UserDetailView()
    
    override func loadView() {
        view = userDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

}
