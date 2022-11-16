//
//  BaseViewController.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/16/22.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Properties
    var screenId: String?
    var screenShownMetaData: [String: String]?
    
    // MARK: - Computed properties
    var isRootViewController: Bool {
        return navigationController == nil || navigationController?.viewControllers.first == self
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didAppearActions()
    }
    
    func didAppearActions() {
        if let screenId = screenId, screenId != "" {
//            AnalyticsFacade.shared.handleScreenView(name: screenId, metaData: screenShownMetaData)
        }
    }
}
