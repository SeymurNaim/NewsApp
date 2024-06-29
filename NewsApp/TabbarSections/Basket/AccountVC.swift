//
//  AccountVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 29.06.24.
//

import UIKit
import RealmSwift

class AccountVC: UIViewController {
    
    let savedUsername = UserDefaults.standard.string(forKey: "username")
    let savedEmail = UserDefaults.standard.string(forKey: "email")
    let savedPhone = UserDefaults.standard.string(forKey: "phone")

    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ProfileImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 72
        image.clipsToBounds = true
        return image
    }()
    
    let personalInfosStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let usernameUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let emailUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let phoneUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Logout", for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        build()
    }
    
    
    private func build() {
        configureUIElements()
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        usernameLabel.text = "Username:         \(savedUsername!)"
        emailLabel.text = "Email:                 \(savedEmail!)"
        phoneLabel.text = "Phone:               \(savedPhone!)"
    }
    
    private func configureUIElements() {
        view.addSubview(profileImage)
        view.addSubview(personalInfosStackView)
        view.addSubview(logoutButton)
        
        personalInfosStackView.addArrangedSubview(usernameLabel)
        personalInfosStackView.addArrangedSubview(usernameUnderline)
        personalInfosStackView.addArrangedSubview(emailLabel)
        personalInfosStackView.addArrangedSubview(emailUnderline)
        personalInfosStackView.addArrangedSubview(phoneLabel)
        personalInfosStackView.addArrangedSubview(phoneUnderline)
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 144),
            profileImage.widthAnchor.constraint(equalToConstant: 144),
            
            personalInfosStackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 64),
            personalInfosStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personalInfosStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personalInfosStackView.heightAnchor.constraint(equalToConstant: 200),
            
            logoutButton.topAnchor.constraint(equalTo: personalInfosStackView.bottomAnchor, constant: 88),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoutButton.heightAnchor.constraint(equalToConstant: 44),
            
            usernameUnderline.heightAnchor.constraint(equalToConstant: 1),
            usernameUnderline.widthAnchor.constraint(equalTo: personalInfosStackView.widthAnchor),
            emailUnderline.heightAnchor.constraint(equalToConstant: 1),
            emailUnderline.widthAnchor.constraint(equalTo: personalInfosStackView.widthAnchor),
            phoneUnderline.heightAnchor.constraint(equalToConstant: 1),
            phoneUnderline.widthAnchor.constraint(equalTo: personalInfosStackView.widthAnchor)
        ])
    }
    
    
    

  
    @objc func logoutButtonTapped() {
        UserDefaults.standard.removeObject(forKey: "loginPassed")
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
        navigationController?.popViewController(animated: true)
        
    }
}
