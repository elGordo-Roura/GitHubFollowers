//
//  SearchView.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/16/22.
//

import SwiftUI
import UIKit
import ElGordoRouraTools

@objc protocol SearchViewDelegate: AnyObject {
    func dismissViewController(_ searchView: SearchView)
    func pushFollowerListViewController(_ searchView: SearchView)
}

class SearchView: BaseView {
    let logoImageView = UIImageView()
    let usernameTextField = CRTextField()
    let callToActionButton = CRButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    weak var delegate: SearchViewDelegate? = nil
    
    override func configureView() { createDismissKeyboardTapGesture() }
    
    override func configureSubviews() {
        // LogoImageView
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        // CallToActionButton
        callToActionButton.addTarget(self, action: #selector(handleCallToActionButtonTapped), for: .touchUpInside)
    }
    
    override func constructSubviewHierarchy() {
        addSubview(logoImageView)
        addSubview(usernameTextField)
        addSubview(callToActionButton)
    }
    
    override func constructSubviewConstraints() {
        // LogoImageView
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80)
        ])
        
        // UsernameTextField
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48)
        ])
        
        // CallToActionButton
        NSLayoutConstraint.activate([
            callToActionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
            callToActionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

// Helper Methods
extension SearchView {
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        delegate?.dismissViewController(self)
    }
    
    @objc func handleCallToActionButtonTapped() {
        delegate?.pushFollowerListViewController(self)
    }
}
