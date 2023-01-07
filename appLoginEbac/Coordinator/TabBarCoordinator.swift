//
//  TabBarCoordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 19/12/22.
//

import UIKit

class TabBarCoordinator: NSObject, Coordinator {

    //MARK: - Properts
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    //MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK: - Methods
    func start() {
        let coordinator = HomeCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
    func startProfire() {
        let coordinator = ProfileCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    

}
