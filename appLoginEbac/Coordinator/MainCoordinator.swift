//
//  MainCoordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/12/22.
//

import UIKit

class MainCoordinator: Coordinator {
    
    //MARK: - Properts
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    //MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Methods
    func start() {
        let viewController = LoginViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func startHome() {
        let tabBarViewController = TabBarController()
        tabBarViewController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarViewController, animated: false)
    }
    
    func startTab(tab: TabBarItemConfiguration) {
        
        switch tab {
        case .tab0:
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        case .tab1:
            let coordinator = ProfileCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
    }
    
    func startRegister() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }

}
