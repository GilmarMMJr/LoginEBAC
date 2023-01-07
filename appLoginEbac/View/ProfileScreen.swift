//
//  ProfileScreen.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/10/22.
//

import UIKit

class ProfileScreen: UIView {
    
    lazy var emailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Email", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        return button
    }()
        
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sair", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 255/255, green: 202/255, blue: 40/255, alpha: 1.0)
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSetup(){
        configBackgroundColor()
        configSuperVIew()
        setupConstraints()
    }
    
    private func configBackgroundColor(){
        self.backgroundColor = .white
    }
    
    private func configSuperVIew(){
        addSubview(emailButton)
        addSubview(logoutButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            emailButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            emailButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 20),
            logoutButton.leadingAnchor.constraint(equalTo: emailButton.leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: emailButton.trailingAnchor, constant: -20),
            logoutButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
}
