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
    
    func start1(dataController: DataController) {
        let viewController = LoginViewController()
        viewController.coordinator = self
        viewController.dataController = dataController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func startHome(dataController: DataController) {
        let tabBarViewController = TabBarController()
        tabBarViewController.dataController = dataController
        tabBarViewController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarViewController, animated: false)
    }
    
    func startTab(tab: TabBarItemConfiguration, dataController: DataController) {
        
        switch tab {
        case .tab0:
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start1(dataController: dataController)
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
