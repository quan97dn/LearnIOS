import Foundation

class UserDefaultsService {
    private static let userDefault = UserDefaults.standard
    
    static func setAccountLogin(username: String) -> Void {
        userDefault.set(["username": username], forKey: "username")
    }
    
    static func getAccountLogin() -> [String: String] {
        return (userDefault.value(forKey: "username") as? [String: String]) ?? [:]
    }
    
    static func isAuthLogin() -> Bool {
        return !self.getAccountLogin().isEmpty
    }
}
