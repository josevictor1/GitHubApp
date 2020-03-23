//
//  LoginView.swift
//  GitHub
//
//  Created by José Victor Pereira Costa on 29/02/20.
//  Copyright © 2020 José Victor Pereira Costa. All rights reserved.
//

import UIKit

public final class LoginView: UIView {
    
    // MARK: - Actions closures
    
    var getFollowersButtonTapped: ((String) -> Void)?
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    private lazy var logoImage: UIImageView = {
        let image = UIImage(named: "gh-logo")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Username"
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private lazy var getFollowersButton: UIButton = {
        let button = UIButton()
        let label = UILabel()
        button.setTitle("Get Followers", for: .normal)
        button.backgroundColor = UIColor(red: 45/255,
                                         green: 186/255,
                                         blue: 78/255,
                                         alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    func setUpSubviews() {
        setUpLogoImageView()
        setUpUsernameTextField()
        setUpGetFollowersButton()
        backgroundColor = .systemBackground
    }
    
    private func setUpLogoImageView() {
        let constraints = [logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 70),
                           logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 77),
                           logoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -77),
                           logoImage.heightAnchor.constraint(lessThanOrEqualToConstant: 200)]
        place(logoImage, with: constraints)
    }
    
    private func setUpUsernameTextField() {
        let constraints = [usernameTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 53),
                           usernameTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 31),
                           usernameTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -31),
                           usernameTextField.heightAnchor.constraint(equalToConstant: 62)]
        place(usernameTextField, with: constraints)
    }
    
    private func setUpGetFollowersButton() {
        let constraints = [getFollowersButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 31),
                           getFollowersButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -31),
                           getFollowersButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -31),
                           getFollowersButton.heightAnchor.constraint(equalToConstant: 62),
                           getFollowersButton.topAnchor.constraint(greaterThanOrEqualTo: usernameTextField.bottomAnchor, constant: 10)]
        place(getFollowersButton, with: constraints)
    }
    
}
