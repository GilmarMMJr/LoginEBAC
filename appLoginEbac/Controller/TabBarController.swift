//
//  TabBarController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/12/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func loadView() {
        super.loadView()
        
        setupBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .white
        self.modalPresentationStyle = .fullScreen
        
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
