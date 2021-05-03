//
//  LoginViewController.swift
//  QuanAnNgon
//
//  Created by MBP0037 on 4/30/21.
//

import UIKit
import CoreData
import Foundation

class LoginViewController: UIViewController, LoginDelegate {
    
    var fetchedResultsController: NSFetchedResultsController<Users>!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    let loginVM = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styleUI()
        loginVM.delegate = self
    }
    
    func styleUI() -> Void {
        // Style input username
        txtUsername.layer.borderWidth = 2
        txtUsername.layer.borderColor = UIColor.white.cgColor
        txtUsername.layer.cornerRadius = 10
        Input.setTextPlaceholder(
            txtUsername,
            text: "Tài khoản"
        )
        Input.setPaddingPlaceholder(txtUsername)

        // Style input password
        txtPassword.layer.borderWidth = 2
        txtPassword.layer.borderColor = UIColor.white.cgColor
        txtPassword.layer.cornerRadius = 10
        Input.setTextPlaceholder(
            txtPassword,
            text: "Mật khẩu"
        )
        Input.setPaddingPlaceholder(txtPassword)
        
        // Style button login
        btnLogin.layer.borderWidth = 2
        btnLogin.layer.borderColor = UIColor.white.cgColor
        btnLogin.layer.cornerRadius = 10
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        loginVM.username = txtUsername.text!
        loginVM.password = txtPassword.text!
        loginVM.login()
    }
    
    func loginDone(type: LoginDone) {
        if type == .error {
            Popup.showAlert(self, message: "Đăng Nhập Thất Bại")
        } else {
            let scene = UIApplication.shared.connectedScenes.first
            if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                sd.changeScreen(type: .tabbar)
            }
        }
    }
}
