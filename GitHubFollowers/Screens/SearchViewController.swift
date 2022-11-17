//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/15/22.
//

import SwiftUI
import UIKit
import ElGordoRouraTools

class SearchViewController: BaseViewController, RootViewOwner {
    typealias RootViewType = SearchView
    
    var isUsernameEntered: Bool {
        if let userNameText = rootView.usernameTextField.text {
            return !userNameText.isEmpty
        } else {
            return false
        }
    }
    
    override func loadView() {
        view = RootViewType()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenId = "SearchViewController"
        rootView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - SearchViewDelegate
extension SearchViewController: SearchViewDelegate {
    func dismissViewController(_ searchView: SearchView) {
        rootView.usernameTextField.resignFirstResponder()
    }
    
    func pushFollowerListViewController(_ searchView: SearchView) {
        guard isUsernameEntered else {
            presentCRAlertOnMainThread(title: "Empty Username",
                                       message: CRError.noUsername,
                                       buttonTitle: "Ok")
            return
        }
        
        let followerListViewController = FollowerListViewController()
        followerListViewController.username = rootView.usernameTextField.text
        
        navigationController?.pushViewController(followerListViewController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListViewController(rootView)
        return true
    }
}

struct SearchViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
