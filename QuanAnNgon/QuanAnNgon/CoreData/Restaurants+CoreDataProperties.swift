//
//  Restaurants+CoreDataProperties.swift
//  QuanAnNgon
//
//  Created by MBP0037 on 5/2/21.
//
//

import Foundation
import CoreData


extension Restaurants {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurants> {
        return NSFetchRequest<Restaurants>(entityName: "Restaurants")
    }

    @NSManaged public var name: String?
    @NSManaged public var review: String?
    @NSManaged public var location: String?
    @NSManaged public var users: Users?

}

extension Restaurants : Identifiable {

}
