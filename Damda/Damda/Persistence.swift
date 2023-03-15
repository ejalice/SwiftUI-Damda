//
//  Persistence.swift
//  Damda
//
//  Created by eunji on 2022/11/07.
//

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()

  let container: NSPersistentContainer

  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Damda")
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }
    func saveContext() {
      let context = container.viewContext
      if context.hasChanges {
        do {
          try context.save()
        } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
      }
    }
    
//    func addDrink(title: String, startDate: Date) {
//      let newDrink = Drink(context: managedObjectContext)
//
//        newDrink.drinkName = title
//        newDrink.startDate = startDate
//
//      saveContext()
//    }
    
    func addStartDate(newStartDate: Date) {
        let newStartDate = startDate()
    }

    
}

