//
//  TabBarItemConfiguration.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 14/12/22.
//

import Foundation

enum TabBarItemConfiguration {
    
    case tab0
    case tab1
    
    var tabBarItemImageNamed: String {
        switch self {
        case .tab0:
            return "homekit"
        case .tab1:
            return "person"
        }
    }
    
    var tabBarItemTitle: String {
        switch self {
        case .tab0:
            return "Notice"
        case .tab1:
            return "Profire"
        }
    }
    
    
}
