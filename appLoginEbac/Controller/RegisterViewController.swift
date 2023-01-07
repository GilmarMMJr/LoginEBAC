//
//  RegisterViewController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/10/22.
//

import UIKit
import FirebaseAuth


class RegisterViewController: UIViewController {
    
    lazy var auth = Auth.auth()
    var coordinator: MainCoordinator?
    lazy var registerScreen: RegisterScreen = {
        let view = RegisterScreen(frame: .zero)
        view.signUpButton.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        view.emailTextField.addTarget(self, action: #selector(handleTextInputChanger), for: .editingDidEnd)
        view.passwordTextField.addTarget(self, action: #selector(handleTextInputChanger), for: .editingDidEnd)
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = registerScreen
    }
}

extension RegisterViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    @objc
    func handleSignup() {
        guard let email = registerScreen.emailTextField.text, !email.isEmpty else { return }
        guard let password = registerScreen.passwordTextField.text, !password.isEmpty else { return }

        auth.createUser(withEmail: email, password: password, completion: { (user, error: Error?) in

            if let err = error {
                print("Error:", err)
                print("Email:", email)

                self.dispatchAlert("Error", message: "\(err) with email: \(email)")

                return
            }

            print("Success userId:", user?.user.uid ?? "")
            self.navigationController?.popToRootViewController(animated: false)
            
        })
    }
    
    @objc
    func handleTextInputChanger() {
        let isEmailValid = registerScreen.emailTextField.text?.isEmpty != true &&
        registerScreen.passwordTextField.text?.isEmpty != true
        
        if isEmailValid {
            registerScreen.signUpButton.isEnabled = true
            registerScreen.signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        } else {
            registerScreen.signUpButton.isEnabled = false
            registerScreen.signUpButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        }
    }
    
}
