import SwiftUI
import Foundation
import CoreData

class RestaurantRepository {
    var fetchedResultsController: NSFetchedResultsController<Restaurants>!
    var entity: String
    
    private static var sharedRepository: RestaurantRepository = {
        return RestaurantRepository()
    }()
        
    class func shared() -> RestaurantRepository {
        return sharedRepository
    }
    
    private init() {
        self.entity = "Restaurants"
    }
    
    func getAllRestaurants(sortKey: String? = "objectId", error: ((Error)->())?) -> [Restaurants] {
        var result = [Restaurants]()
        let fetchRequest: NSFetchRequest<Restaurants> = Restaurants.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: sortKey, ascending: true)]
        let managedContext = AppDelegate.managedObjectContext!
        
        
        do {
            result = try managedContext.fetch(Restaurants.fetchRequest()) as! [Restaurants]
        } catch let e {
            error?(e)
            return result
        }

        return result
    }
    
    func addRestaurant(
        name: String,
        review: String,
        location: String?,
        error: ((Error)->())?
    ) -> Restaurants {
        let managedContext = AppDelegate.managedObjectContext!
        let restaurant = NSEntityDescription.insertNewObject(forEntityName: self.entity, into: managedContext) as! Restaurants
        
        restaurant.setValue(name, forKeyPath: "name")
        restaurant.setValue(review, forKeyPath: "review")
        restaurant.setValue(location, forKeyPath: "location")

        do {
            try managedContext.save()
        } catch let e {
            error?(e)
        }
        
        return restaurant
    }
    
    func addRestaurantToUser(_ username: String, name: String, review: String, location: [String: Int], error: ((Error)->())?) -> Void {
        let managedContext = AppDelegate.managedObjectContext!
        var restaurants = Set<Restaurants>()
        let user = UserRepository.shared().getUserByUsername(username: username, error: nil)
        let restaurant = self.addRestaurant(name: name, review: review, location: location.description, error: nil)
        restaurants.insert(restaurant)
        user.addToRestaurants(restaurants as NSSet)
        do {
            try managedContext.save()
        } catch let e {
            error?(e)
        }
    }
    
    func removeAllRestaurants(error: ((Error)->())?) -> Void {
        let managedContext = AppDelegate.managedObjectContext!
        let removeAll = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: self.entity))
        do {
            try managedContext.execute(removeAll)
        }
        catch let e {
            error?(e)
        }
    }
}
