//
//  CRAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/16/22.
//

import UIKit

class CRAvatarImageView: UIImageView {
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
