//
//  LoginVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit

class LoginVC: UIViewController {

    let logoImage = UIImageView()
    let emailText = UITextField()
    let passwordText = UITextField()
    let stackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        build()
    }
    
    
    func build() {
        configureLogoImage()
        configureStackView()
        configureStackElements()
    }

   
    func configureLogoImage() {
        logoImage.image = UIImage(named: "Logo!")
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 88),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 240),
            logoImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 88),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func configureStackElements() {
        emailText.placeholder = "email"
        emailText.textAlignment = .center
        emailText.borderStyle = .roundedRect
        emailText.layer.cornerRadius = 26
        stackView.addArrangedSubview(emailText)
        
        passwordText.placeholder = "password"
        passwordText.textAlignment = .center
        passwordText.borderStyle = .roundedRect
        passwordText.layer.cornerRadius = 26
        stackView.addArrangedSubview(passwordText)
    }

}



//    loginButton.layer.cornerRadius = 26
//    loginButton.backgroundColor = .black
//    loginButton.setTitleColor(.white, for: .normal)
//    loginButton.setTitle("Login", for: .normal)
//    stackView.addArrangedSubview(loginButton)
//    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//    
//    registerButton.layer.cornerRadius = 10
//    registerButton.backgroundColor = .clear
//    registerButton.setTitle("Register", for: .normal)
//    registerButton.setTitleColor(.white, for: .normal)
//    stackView.addArrangedSubview(registerButton)
//    registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
//}
