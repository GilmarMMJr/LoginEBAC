//
//  Coordinator.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 13/11/22.
//

import UIKit

protocol Coordinator: AnyObject {
    
    //MARK: - Properts
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    //MARK: - Methods
    func start()
    
}
