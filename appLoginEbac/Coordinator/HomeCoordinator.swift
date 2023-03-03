//
//  HomeCoordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 13/11/22.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator {

    //MARK: - Properts
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    //MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK: - Methods
    func start() {
        let viewController = HomeViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func start1(dataController: DataController) {
        let viewController = HomeViewController()
        viewController.dataController = dataController
        navigationController.pushViewController(viewController, animated: false)
    }
    

}

