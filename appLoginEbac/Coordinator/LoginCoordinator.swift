//
//  LoginCoordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 13/11/22.
//

import UIKit

class LoginCoordinator: Coordinator {
   
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc =  LoginViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
