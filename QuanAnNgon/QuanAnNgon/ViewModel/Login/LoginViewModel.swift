//
//  LoginViewModel.swift
//  QuanAnNgon
//
//  Created by MBP0037 on 4/30/21.
//


protocol LoginDelegate {
    func loginDone(type: LoginDone)
}

class LoginViewModel {
    var username: String = ""
    var password: String = ""
    
    var delegate: LoginDelegate?
    
    func login() -> Void {
        let username = self.username.trimmingCharacters(in: .whitespaces)
        let password = self.password.trimmingCharacters(in: .whitespaces)
        if username.isEmpty || password.isEmpty {
            delegate?.loginDone(type: .error)
            return
        }
        guard UserRepository.shared().isUserAuth(username: username, password: password, error: nil) else {
            delegate?.loginDone(type: .error)
            return
        }
        UserDefaultsService.setAccountLogin(username: username)
        delegate?.loginDone(type: .success)
    }
}
