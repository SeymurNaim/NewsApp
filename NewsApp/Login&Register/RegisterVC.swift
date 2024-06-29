//
//  RegisterVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit

class RegisterVC: UIViewController {
    
    let logoImage = UIImageView()
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let emailTextField = UITextField()
    let phoneTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()
    let staticLabel = UILabel() // for who are you question.
    let secondStaticLabel = UILabel()
    let termsButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        build()
    }
    
    func build() {
        configureLogoImage()
        configureStackView()
        configureStackElements()
        configureUserNameUnderLine()
        configureEmailUnderLine()
        configurePhoneUnderLine()
        configurePasswordUnderLine()
        configureSignUpButton()
        configureSecondStaticLabel()
        configureTermsButton()
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
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureStackElements() {
        usernameTextField.placeholder = "userName"
        usernameTextField.textAlignment = .left
        stackView.addArrangedSubview(usernameTextField)
        
        emailTextField.placeholder = "email"
        emailTextField.textAlignment = .left
        stackView.addArrangedSubview(emailTextField)
        
        phoneTextField.placeholder = "phone"
        phoneTextField.textAlignment = .left
        stackView.addArrangedSubview(phoneTextField)
        
        passwordTextField.placeholder = "password"
        passwordTextField.textAlignment = .left
        stackView.addArrangedSubview(passwordTextField)
    }

    func configureUserNameUnderLine() {
        let userNameUnderLine = UIView()
        userNameUnderLine.backgroundColor = .black
        userNameUnderLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameUnderLine)
        
        NSLayoutConstraint.activate([
            userNameUnderLine.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 1),
            userNameUnderLine.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            userNameUnderLine.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            userNameUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configureEmailUnderLine() {
        let emailUnderline = UIView()
        emailUnderline.backgroundColor = .black
        emailUnderline.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailUnderline)
        
        NSLayoutConstraint.activate([
            emailUnderline.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 1),
            emailUnderline.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            emailUnderline.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            emailUnderline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configurePhoneUnderLine() {
        let phoneUnderline = UIView()
        phoneUnderline.backgroundColor = .black
        phoneUnderline.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneUnderline)
        
        NSLayoutConstraint.activate([
            phoneUnderline.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 1),
            phoneUnderline.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
            phoneUnderline.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor),
            phoneUnderline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configurePasswordUnderLine() {
        let passwordUnderline = UIView()
        passwordUnderline.backgroundColor = .black
        passwordUnderline.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordUnderline)

        NSLayoutConstraint.activate([
            passwordUnderline.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 1),
            passwordUnderline.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordUnderline.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            passwordUnderline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configureSignUpButton() {
        signUpButton.layer.cornerRadius = 18
        signUpButton.backgroundColor = .systemBlue
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88),
            signUpButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func signUpButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let phone = phoneTextField.text, !phone.isEmpty else {

            showAlert(message: "Please fill in all fields.")
            return
        }
        
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(phone, forKey: "phone")
                
        let vc = LoginVC()
        navigationController?.show(vc, sender: nil)
        showAlert(message: "Registration successful.")

    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    
    func configureSecondStaticLabel() {
        secondStaticLabel.text = "By signing up to DDX app you are accepting our"
        secondStaticLabel.textAlignment = .center
        secondStaticLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(secondStaticLabel)
        secondStaticLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondStaticLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 32),
            secondStaticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            secondStaticLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            secondStaticLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configureTermsButton() {
        termsButton.backgroundColor = .clear
        termsButton.setTitleColor(.black, for: .normal)
        termsButton.setTitle("Terms & Conditions", for: .normal)
        termsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        termsButton.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        
        view.addSubview(termsButton)
        termsButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            termsButton.topAnchor.constraint(equalTo: secondStaticLabel.bottomAnchor),
            termsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            termsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            termsButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc func termsButtonTapped() {
        
    }

    
    
}
