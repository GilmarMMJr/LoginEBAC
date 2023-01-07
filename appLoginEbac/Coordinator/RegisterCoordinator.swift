//
//  RegisterCoordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 13/11/22.
//

import UIKit

class RegisterCoordinator: Coordinator {
    
    //MARK: - Properts
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    //MARK: - Initializers
   required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Methods
    func start() {
        let vc = RegisterViewController()
        navigationController.pushViewController(vc, animated: false)
//        navigationController.present(vc, animated: true)
    }
        
}
