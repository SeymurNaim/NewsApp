//
//  ProfileVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit

class SettingsVC: UIViewController {
    
    let accountStaticLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "ACCOUNT"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let generalStaticLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "GENERAL"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var loginOrRegisterStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login to your DDX Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let loginUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create a free DDX Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let registerUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var accountStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let accountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Account Settings", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let accountUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var generalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send Feedback", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let feedbackUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let helpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Help for Closed Captioning", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let helpUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let privacytUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let termsOfUseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Use", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let termstUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addChoicesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Choices", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    let versionStaticLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Version 24.12.0 | Build 11041998"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Settings"
        build()
        
        if UserDefaults.standard.bool(forKey: "loginPassed") {
            loginOrRegisterStackView.isHidden = true
        } else {
            accountStackView.isHidden = true
        }
    }
    
    
    private func build() {
        configureUIElements()
        
    }
    
    private func configureUIElements() {
        view.addSubview(accountStaticLabel)
        view.addSubview(loginOrRegisterStackView)
        view.addSubview(accountStackView)
        view.addSubview(generalStaticLabel)
        view.addSubview(generalStackView)
        view.addSubview(versionStaticLabel)
        
        loginOrRegisterStackView.addArrangedSubview(loginButton)
        loginOrRegisterStackView.addArrangedSubview(loginUnderline)
        loginOrRegisterStackView.addArrangedSubview(registerButton)
        loginOrRegisterStackView.addArrangedSubview(registerUnderline)
        
        accountStackView.addArrangedSubview(accountButton)
        accountStackView.addArrangedSubview(accountUnderline)
        
        generalStackView.addArrangedSubview(feedbackButton)
        generalStackView.addArrangedSubview(feedbackUnderline)
        generalStackView.addArrangedSubview(helpButton)
        generalStackView.addArrangedSubview(helpUnderline)
        generalStackView.addArrangedSubview(privacyButton)
        generalStackView.addArrangedSubview(privacytUnderline)
        generalStackView.addArrangedSubview(termsOfUseButton)
        generalStackView.addArrangedSubview(termstUnderline)
        generalStackView.addArrangedSubview(addChoicesButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        accountButton.addTarget(self, action: #selector(accountButtonTapped), for: .touchUpInside)


        
        
        NSLayoutConstraint.activate([
            accountStaticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            accountStaticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            accountStaticLabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            loginOrRegisterStackView.topAnchor.constraint(equalTo: accountStaticLabel.bottomAnchor, constant: 20),
            loginOrRegisterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginOrRegisterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginOrRegisterStackView.heightAnchor.constraint(equalToConstant: 88),
            
            accountStackView.topAnchor.constraint(equalTo: accountStaticLabel.bottomAnchor, constant: 32),
            accountStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            accountStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            accountStackView.heightAnchor.constraint(equalToConstant: 64),
            
            loginUnderline.heightAnchor.constraint(equalToConstant: 1),
            loginUnderline.widthAnchor.constraint(equalTo: loginOrRegisterStackView.widthAnchor),
            registerUnderline.heightAnchor.constraint(equalToConstant: 1),
            registerUnderline.widthAnchor.constraint(equalTo: loginOrRegisterStackView.widthAnchor),
            accountUnderline.heightAnchor.constraint(equalToConstant: 1),
            accountUnderline.widthAnchor.constraint(equalTo: accountStackView.widthAnchor),
            
            generalStaticLabel.topAnchor.constraint(equalTo: accountStaticLabel.bottomAnchor, constant: 160),
            generalStaticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generalStaticLabel.heightAnchor.constraint(equalToConstant: 24),
            
            generalStackView.topAnchor.constraint(equalTo: generalStaticLabel.bottomAnchor, constant: 20),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            generalStackView.heightAnchor.constraint(equalToConstant: 320),
            
            feedbackUnderline.heightAnchor.constraint(equalToConstant: 1),
            feedbackUnderline.widthAnchor.constraint(equalTo: generalStackView.widthAnchor),
            helpUnderline.heightAnchor.constraint(equalToConstant: 1),
            helpUnderline.widthAnchor.constraint(equalTo: generalStackView.widthAnchor),
            privacytUnderline.heightAnchor.constraint(equalToConstant: 1),
            privacytUnderline.widthAnchor.constraint(equalTo: generalStackView.widthAnchor),
            termstUnderline.heightAnchor.constraint(equalToConstant: 1),
            termstUnderline.widthAnchor.constraint(equalTo: generalStackView.widthAnchor),
            
            versionStaticLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            versionStaticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            versionStaticLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            versionStaticLabel.heightAnchor.constraint(equalToConstant: 32)
            
        ])
    }
    
    @objc func loginButtonTapped() {
        let vc = LoginVC()
        navigationController?.show(vc, sender: nil)
    }

    @objc func registerButtonTapped() {
        let vc = RegisterVC()
        navigationController?.show(vc, sender: nil)
    }
    
    @objc func accountButtonTapped() {
        let vc = AccountVC()
        navigationController?.show(vc, sender: nil)
    }


}
