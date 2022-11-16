//
//  ViewController.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/15/22.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
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
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
