//
//  LoginViewController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 30/07/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    lazy var auth = Auth.auth()
    lazy var loginScreen: LoginScreen = {
        let view = LoginScreen(frame: .zero)
        view.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        view.registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
                if auth.currentUser != nil {
                    DispatchQueue.main.async {
                        self.coordinator?.startHome()
                    }
                }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = loginScreen
        
    }
    
    @objc
    func loginTapped() {
        
        if validateTextField() {
            dispatchAlert(nil, message: "Check your login was completed correctly.")
        } else {
            guard let email = loginScreen.emailTextField.text, !email.isEmpty else { return }
            guard let password = loginScreen.passwordTextField.text, !password.isEmpty else { return }
            
            
            auth.signIn(withEmail: email,
                               password: password,
                               completion: { [self] (user, error) in
                
                if error != nil {
                    dispatchAlert(nil, message: "Falhou para logar o usuario com email e senha")
                }
                
                print("Yes login feito!")
                
                completeLogin()
            })
        }
        
    }
    
    func completeLogin() {
        DispatchQueue.main.async {
            self.coordinator?.startHome()
        }
    }
    
    func validateTextField() -> Bool {
        guard let email = loginScreen.emailTextField.text,
              let password = loginScreen.passwordTextField.text else { return false }
        if email.isEmpty || password.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    
    @objc
    func registerTapped() {
        coordinator?.startRegister()
    }
    
}
