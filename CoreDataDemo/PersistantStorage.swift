//
//  PersistantStorage.swift
//  CoreDataDemo
//
//  Created by Twinbit Limited on 27/10/22.
//

import Foundation
import CoreData

final class PersistantStorage{
    
    // MARK: - Core Data stack
    private init (){
        
    }
    static let shared = PersistantStorage()

    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
              
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support

    func saveContext () {
       // let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
              
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
