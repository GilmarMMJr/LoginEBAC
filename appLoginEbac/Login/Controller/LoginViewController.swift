//
//  LoginViewController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 30/07/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        super.loadView()
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    


}

