//
//  HomeTabBarController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 18/08/22.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarcontroller()
        
    }
    
    private func setupTabBarcontroller(){
        
        let notice = UINavigationController(rootViewController: NoticeTableViewController())
        let profire = UINavigationController(rootViewController: ProfileViewController())
        
        self.setViewControllers([notice, profire], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        guard let items = tabBar.items else {return}
        
        items[0].title = "Notice"
        items[0].image = UIImage(systemName: "house")
        
        items[1].title = "Profire"
        items[1].image = UIImage(systemName: "person")
        
    }
    

}
