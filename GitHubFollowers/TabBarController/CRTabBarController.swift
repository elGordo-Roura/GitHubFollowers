//
//  CRTabBarController.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/15/22.
//

import SwiftUI
import UIKit

class CRTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppAppearance()
        setupViewControllers()
    }
    
    private func setAppAppearance() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.prefersLargeTitles = true
        navBarAppearance.tintColor = .systemGreen
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = .systemGreen
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createViewControllers(SearchViewController(),
                                  title: "Search",
                                  item: .init(tabBarSystemItem: .search, tag: 0)),
            createViewControllers(FavoritesListViewController(),
                                  title: "Favorites",
                                  item: .init(tabBarSystemItem: .favorites, tag: 1))
        ]
    }
    
    private func createViewControllers(
        _ viewController: UIViewController,
        title: String,
        item: UITabBarItem
    ) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        viewController.view.backgroundColor = .systemBackground
        viewController.title = title
        
        return navController
    }
}


struct ContentView: View {
    var body: some View {
        MainContainerView().ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CRTabBarController
    
    func makeUIViewController(context: Context) -> CRTabBarController {
        CRTabBarController()
    }
    
    func updateUIViewController(_ uiViewController: CRTabBarController, context: Context) {}
}
