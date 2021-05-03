import SwiftUI
import CoreData
import Foundation

class UserRepository {
    var entity: String
    
    private static var sharedRepository: UserRepository = {
        return UserRepository()
    }()
        
    class func shared() -> UserRepository {
        return sharedRepository
    }
    
    private init() {
        self.entity = "Users"
    }
    
    func getAllUsers(sortKey: String? = "objectId", error: ((Error)->())?) -> [Users] {
        var result = [Users]()
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: sortKey, ascending: true)]
        let managedContext = AppDelegate.managedObjectContext!
        
        
        do {
            result = try managedContext.fetch(Users.fetchRequest()) as! [Users]
        } catch let e {
            error?(e)
            return result
        }

        return result
    }
    
    func isUserAuth(username: String, password: String, error: ((Error)->())?) -> Bool {
        var result = [Users]()
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "objectId", ascending: true)]
        let managedContext = AppDelegate.managedObjectContext!
        
        do {
            result = try managedContext.fetch(Users.fetchRequest()) as! [Users]
        } catch let e {
            error?(e)
            return false
        }
        return result.count > 0
    }
    
    func getUserIndex(index: Int, error: ((Error)->())?) -> NSObject {
        var result = [Users]()
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "objectId", ascending: true)]
        let managedContext = AppDelegate.managedObjectContext!
        
        do {
            result = try managedContext.fetch(Users.fetchRequest())
        } catch let e {
            error?(e)
        }
        
        return result[index]
    }
    
    func getUserByUsername(username: String, error: ((Error)->())?) -> Users {
        var result = [Users]()
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        let managedContext = AppDelegate.managedObjectContext!
        
        do {
            result = try managedContext.fetch(Users.fetchRequest())
        } catch let e {
            error?(e)
            return Users()
        }
        return result.isEmpty ? Users() : result[0]
    }
    
    func addUser(
        username: String,
        password: String,
        fullName: String?,
        error: ((Error)->())?
    ) -> Users {
        let managedContext = AppDelegate.managedObjectContext!
        let user = NSEntityDescription.insertNewObject(forEntityName: self.entity, into: managedContext) as! Users
        
        user.setValue(fullName ?? "", forKeyPath: "fullname")
        user.setValue(username, forKeyPath: "username")
        user.setValue(password, forKeyPath: "password")

        do {
            try managedContext.save()
        } catch let e {
            error?(e)
        }
        
        return user
    }
    
    func removeAllUsers(error: ((Error)->())?) -> Void {
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
