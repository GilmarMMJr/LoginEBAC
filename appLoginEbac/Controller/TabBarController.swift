//
//  TabBarController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/12/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Properts
    let coordinatorForTab0 = MainCoordinator(navigationController: UINavigationController())
    let coordinatorForTab1 = MainCoordinator(navigationController: UINavigationController())

    override func loadView() {
        super.loadView()
        
        setupBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .white
        
        coordinatorForTab0.startTab(tab: .tab0)
        coordinatorForTab1.startTab(tab: .tab1)
        
        viewControllers = [
            coordinatorForTab0.navigationController,
            coordinatorForTab1.navigationController
        ]
        
        start(tab: .tab0, vc: coordinatorForTab0.navigationController)
        start(tab: .tab1, vc: coordinatorForTab1.navigationController)
        
    }
    
    private func start(tab: TabBarItemConfiguration, vc: UIViewController) {
    
        let title = tab.tabBarItemTitle
        let image = UIImage(systemName: tab.tabBarItemImageNamed)
        let selectImage = UIImage(systemName: tab.tabBarItemImageNamed)
        
        vc.tabBarItem = UITabBarItem(title: title,
                                     image: image,
                                     selectedImage: selectImage)
        
    }
    
    private func setupBar() {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = .white
        
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
}
