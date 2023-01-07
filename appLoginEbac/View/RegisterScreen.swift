//
//  RegisterScreen.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/10/22.
//

import UIKit

class RegisterScreen: UIView {
    
    //MARK: - Properts
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.backgroundColor = UIColor(white: 0, alpha: 0.03)
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.autocapitalizationType = .none
        email.font = .systemFont(ofSize: 14)
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.backgroundColor = UIColor(white: 0, alpha: 0.03)
        password.borderStyle = .roundedRect
        password.font = .systemFont(ofSize: 14)
        return password
    }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton(type: .system)
        signUp.setTitle("SignUp", for: .normal)
        signUp.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        signUp.layer.cornerRadius = 5
        signUp.titleLabel?.font = .systemFont(ofSize: 14)
        signUp.setTitleColor(.white, for: .normal)
        signUp.isEnabled = false
        return signUp
    }()
    
    lazy var alreadyHaveAccountButton: UIButton = {
        let button =  UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedTitle = NSMutableAttributedString(string: "Já tem uma conta  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Sign In.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 17, green: 154, blue: 237)]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)

        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect){
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Visual Elements
    private func configSetup(){
        configBackgroundColor()
        configSuperVIew()
        setupConstraints()
    }
    
    private func configBackgroundColor(){
        self.backgroundColor = .white
    }
    
    private func configSuperVIew(){
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(signUpButton)
        mainStackView.addArrangedSubview(alreadyHaveAccountButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            mainStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
