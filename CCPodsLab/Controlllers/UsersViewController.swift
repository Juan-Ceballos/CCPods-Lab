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
    
    var users = [User]()    {
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
        self.title = "Users"
        
    }
    
    func setupUI()  {
        UsersAPI.fetchUsers { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let users):
                self.users = users
                print(self.users)
            }
        }
    }


}

extension UsersViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell
            else    {
                fatalError()
        }
        
        let user = users[indexPath.row]
        cell.configureCell(user: user)
        
        return cell
    }
    
    
}

extension UsersViewController: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("press")
        
        let userDetailVC = UserDetailViewController()
        navigationController?.pushViewController(userDetailVC, animated: false)
        let user = users[indexPath.row]
        userDetailVC.user = user
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

