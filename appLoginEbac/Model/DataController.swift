//
//  DataController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 21/02/23.
//

import Foundation
import CoreData

class DataController {
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        loadData()
    }

    func loadData(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in

            guard error == nil else {
                print("error \(error?.localizedDescription)")
                return
            }

            completion?()

        }
    }
    

}
