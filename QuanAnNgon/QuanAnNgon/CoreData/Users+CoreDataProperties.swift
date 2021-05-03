//
//  Users+CoreDataProperties.swift
//  QuanAnNgon
//
//  Created by MBP0037 on 5/2/21.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var fullname: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var restaurants: NSSet?

}

// MARK: Generated accessors for restaurants
extension Users {

    @objc(addRestaurantsObject:)
    @NSManaged public func addToRestaurants(_ value: Restaurants)

    @objc(removeRestaurantsObject:)
    @NSManaged public func removeFromRestaurants(_ value: Restaurants)

    @objc(addRestaurants:)
    @NSManaged public func addToRestaurants(_ values: NSSet)

    @objc(removeRestaurants:)
    @NSManaged public func removeFromRestaurants(_ values: NSSet)

}

extension Users : Identifiable {

}
