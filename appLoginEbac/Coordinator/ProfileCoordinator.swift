//
//  ProfileCoordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 16/12/22.
//

import UIKit

class ProfileCoordinator: NSObject, Coordinator {

    //MARK: - Properts
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    //MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK: - Methods
    func start() {
        let viewController = ProfileViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
    

}
