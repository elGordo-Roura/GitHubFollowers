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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = username
    }
}
