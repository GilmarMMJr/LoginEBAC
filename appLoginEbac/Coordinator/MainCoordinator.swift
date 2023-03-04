//
//  MainCoordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/12/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UITabBarControllerDelegate {
    
    //MARK: - Properts
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: TabBarController
    
    //MARK: - Initializers
    init(navigationController: UINavigationController) {
            self.navigationController = navigationController
            self.tabBarController = TabBarController()
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
        let homeViewController = HomeViewController()
        homeViewController.dataController = dataController
        let profileViewController = ProfileViewController()

        let tabBarItems = [TabBarItemConfiguration.tab0, TabBarItemConfiguration.tab1]

        let viewControllers = tabBarItems.map { item -> UINavigationController in
            let viewController = item == .tab0 ? homeViewController : profileViewController
            viewController.tabBarItem = UITabBarItem(title: item.tabBarItemTitle, image: UIImage(systemName: item.tabBarItemImageNamed), tag: 0)

            return UINavigationController(rootViewController: viewController)
        }

        tabBarController.viewControllers = viewControllers
        tabBarController.delegate = self
        navigationController.present(tabBarController, animated: true)
    } 
        
    func startRegister() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }

}
