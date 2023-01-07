//
//  ProfileViewController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 18/08/22.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    var coordinator: MainCoordinator?
    lazy var auth = Auth.auth()
    
    lazy var profileScreen: ProfileScreen = {
        let view = ProfileScreen(frame: .zero)
        view.logoutButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        view.emailButton.addTarget(self, action: #selector(showEmailTap), for: .touchUpInside)
        return view
    }()

    
    override func loadView() {
        super.loadView()
        
        navigationItem.title = "Profire"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view = profileScreen
    }
        
    @objc
    func handleTap() {
        do {
            try auth.signOut()
            logout()
        } catch let signOutError {
            print("signOutError: \(signOutError)")
            dispatchAlert("Error", message: signOutError.localizedDescription)
        }
        
    }
    
    @objc
    func showEmailTap() {
        let userEmail = Auth.auth().currentUser?.email
        profileScreen.emailButton.setTitle(userEmail, for: .normal)
    }
    
    func logout() {
        self.view.window?.rootViewController?.dismiss(animated: true)
    }

}
