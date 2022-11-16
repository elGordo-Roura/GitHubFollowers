//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/15/22.
//

import UIKit

class FollowerListViewController: BaseViewController {
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        guard let username = username else { return }
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, error in
            guard let followers = followers else {
                self.presentCRAlertOnMainThread(title: "Beep boop beep", message: error!, buttonTitle: "Ok")
                return
            }
            
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = username
    }
}
