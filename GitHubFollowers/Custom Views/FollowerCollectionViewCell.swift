//
//  FollowerCollectionViewCell.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/16/22.
//

import UIKit
import ElGordoRouraTools

class FollowerCollectionViewCell: UICollectionViewCell {
    static let reuseId = "FollowerCell"
    
    let avatarImageView = CRAvatarImageView(frame: .zero)
    let usernameLabel = CRTitleLabel(textAlignment: .center, fontSize: 16)
    
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            // AvatarImageView
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            
            // UsernameLabel
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
