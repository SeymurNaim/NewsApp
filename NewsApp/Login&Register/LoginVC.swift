//
//  LoginVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit

class LoginVC: UIViewController {

//    private let logoImage2: UIImageView = {
//        let imageView = UIImageView()
//        
//        return imageView
//    }()
    
    
    let logoImage = UIImageView()
    let emailText = UITextField()
    let passwordText = UITextField()
    let stackView = UIStackView()
    let loginButton = UIButton()
    let registerButton = UIButton()
    let staticLabel = UILabel()
    let staticLabel2 = UILabel()
    let googleSignButton = UIButton()
    let facebookSignButton = UIButton()
    let appleSignButton = UIButton()
    let twitterSignButton = UIButton()
    
    let signInToolsStackView = UIStackView()
    
    let userDefaults = UserDefaults.standard
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        build()
    }
    
    func build() {
        configureLogoImage()
        configureStackView()
        configureStackElements()
        configureLoginButton()
        configureStaticLabel()
        configureSignInStack()
        configureSignInStackElements()
        configureSecondStaticLabel()
        configureRegisterButton()
        configureEmailUnderLine()
        configurePasswordUnderLine()
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
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func configureStackElements() {
        emailText.placeholder = "email"
        emailText.textAlignment = .left
        stackView.addArrangedSubview(emailText)
        
        passwordText.placeholder = "password"
        passwordText.textAlignment = .left
        stackView.addArrangedSubview(passwordText)
    }
    
    func configureEmailUnderLine() {
        let emailUnderline = UIView()
        emailUnderline.backgroundColor = .black
        emailUnderline.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailUnderline)

        NSLayoutConstraint.activate([
            emailUnderline.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 1),
            emailUnderline.leadingAnchor.constraint(equalTo: emailText.leadingAnchor),
            emailUnderline.trailingAnchor.constraint(equalTo: emailText.trailingAnchor),
            emailUnderline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    func configurePasswordUnderLine() {
        let passwordUnderline = UIView()
        passwordUnderline.backgroundColor = .black
        passwordUnderline.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordUnderline)

        NSLayoutConstraint.activate([
            passwordUnderline.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 1),
            passwordUnderline.leadingAnchor.constraint(equalTo: passwordText.leadingAnchor),
            passwordUnderline.trailingAnchor.constraint(equalTo: passwordText.trailingAnchor),
            passwordUnderline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func configureLoginButton() {
        loginButton.layer.cornerRadius = 18
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("Sign in", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 44),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureRegisterButton() {
        registerButton.backgroundColor = .clear
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: staticLabel2.trailingAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 88),
            registerButton.centerYAnchor.constraint(equalTo: staticLabel2.centerYAnchor)
        ])
    }
    
    func configureStaticLabel() {
        staticLabel.text = "- or sign in with -"
        staticLabel.textAlignment = .center
        view.addSubview(staticLabel)
        staticLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            staticLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 44),
            staticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            staticLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            staticLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configureSignInStack() {
        signInToolsStackView.axis = .horizontal
        signInToolsStackView.spacing = 20
        signInToolsStackView.distribution = .fillEqually
        signInToolsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInToolsStackView)
        
        NSLayoutConstraint.activate([
            signInToolsStackView.topAnchor.constraint(equalTo: staticLabel.bottomAnchor, constant: 24),
            signInToolsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            signInToolsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            signInToolsStackView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    func configureSignInStackElements() {
        googleSignButton.setImage(UIImage(named: "google"), for: .normal)
        signInToolsStackView.addArrangedSubview(googleSignButton)
        
        facebookSignButton.setImage(UIImage(named: "facebook"), for: .normal)
        signInToolsStackView.addArrangedSubview(facebookSignButton)
        
        appleSignButton.setImage(UIImage(named: "apple"), for: .normal)
        signInToolsStackView.addArrangedSubview(appleSignButton)
        
        twitterSignButton.setImage(UIImage(named: "twitter"), for: .normal)
        signInToolsStackView.addArrangedSubview(twitterSignButton)
    }
    
    func configureSecondStaticLabel() {
        staticLabel2.text = "Don't have an account?"
        staticLabel2.textAlignment = .center
        view.addSubview(staticLabel2)
        staticLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            staticLabel2.topAnchor.constraint(equalTo: signInToolsStackView.bottomAnchor, constant: 24),
            staticLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            staticLabel2.widthAnchor.constraint(equalToConstant: 180),
            staticLabel2.heightAnchor.constraint(equalToConstant: 24)
        ])

    }
    
    

    
    @objc private func loginButtonTapped() {
         guard let username = emailText.text, !username.isEmpty,
               let password = passwordText.text, !password.isEmpty else {
             showAlert(message: "email and password can not be empty")
             return
         }
         
         let savedUsername = UserDefaults.standard.string(forKey: "email")
         let savedPassword = UserDefaults.standard.string(forKey: "password")
         
         if username == savedUsername && password == savedPassword {
             let controller = TabbarVC()
             controller.modalPresentationStyle = .fullScreen
             controller.modalTransitionStyle = .flipHorizontal
             present(controller, animated: true)
             userDefaults.setValue(true, forKey: "loginPassed")

         } else {
             showAlert(message: "Invalid username or password.")
         }
     }
    
    @objc func registerButtonTapped() {
        navigationController?.pushViewController(RegisterVC().self, animated: true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default))
        present(alert, animated: true)
    }
}


//#Preview() {
//    LoginVC()
//}
