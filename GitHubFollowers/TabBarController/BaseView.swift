//
//  BaseView.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/16/22.
//

import UIKit

open class BaseView: UIView {
    // MARK: Initialization
    public override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        configure()
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: Layout
    override open func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        // 'layoutSublayers' is called for each sublayer of the view.
        // Checking that the 'layer' is the view's backing layer prevents
        // redundant updates to the sublayer layout.
        if layer == self.layer { setSublayerFrames() }
    }
}

@objc
extension BaseView: Constructible {
    open func configureView() { /* No-Op: Override in inheriting class */ }
    open func configureSubviews() { /* No-Op: Override in inheriting class */ }
    open func constructSubviewConstraints() { /* No-Op: Override in inheriting class */ }
    open func setSublayerFrames() { /* No-Op: Override in inheriting class */ }
    open func constructSublayerHierarchy() { /* No-Op: Override in inheriting class */ }
    open func constructSubviewHierarchy() { /* No-Op: Override in inheriting class */ }
    open func constructAccessibility() { /* No-Op: Override in inheriting class */ }
}
