//
//  Drink+CoreDataProperties.swift
//  Damda
//
//  Created by 이창형 on 2023/03/15.
//
//

import Foundation
import CoreData


extension Drink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drink> {
        return NSFetchRequest<Drink>(entityName: "Drink")
    }

    @NSManaged public var brokenDate: Date?
    @NSManaged public var content: String?
    @NSManaged public var drinkName: String?
    @NSManaged public var extendOneDate: Date?
    @NSManaged public var extendTwoDate: Date?
    @NSManaged public var history: Date?
    @NSManaged public var imageName: String?
    @NSManaged public var incidientDate: Date?
    @NSManaged public var maturedDate: Date?
    @NSManaged public var startDate: Date?
    @NSManaged public var id: UUID?

}

extension Drink : Identifiable {

}
