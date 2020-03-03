//
//  ViewController.swift
//  CCPodsLab
//
//  Created by Juan Ceballos on 3/3/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    let usersView = UsersView()
    
    var usersv = [User]()    {
        didSet  {
            DispatchQueue.main.async {
                self.usersView.usersTableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = usersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        usersView.usersTableView.register(UserCell.self, forCellReuseIdentifier: "userCell")
        usersView.usersTableView.dataSource = self
        usersView.usersTableView.delegate = self
        setupUI()
        print("heyaload")
        self.title = "Users"
        
    }
    
    func setupUI()  {
        UsersAPI.fetchUsers { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
                print("heyboo")
            case .success(let users):
                self.usersv = users
                print(self.usersv)
                print("heya")
            }
        }
    }


}

extension UsersViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersv.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell
            else    {
                fatalError()
        }
        
        let user = usersv[indexPath.row]
        cell.configureCell(user: user)
        
        return cell
    }
    
    
}

extension UsersViewController: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("press")
        navigationController?.pushViewController(UserDetailViewController(), animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
}

