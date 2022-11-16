//
//  RootViewOwner.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/16/22.
//

import UIKit

public protocol RootViewOwner {
    /// The type of the root view.
    associatedtype RootViewType: BaseView

    /// The root view of a view hierarchy.
    var rootView: RootViewType { get }

    /// Returns the root view if loaded, nil if not.
    var rootViewIfLoaded: RootViewType? { get }
}

public extension RootViewOwner where Self: UIViewController {
    var rootView: RootViewType { return view as! RootViewType }
    var rootViewIfLoaded: RootViewType? { return viewIfLoaded as? RootViewType }
}
