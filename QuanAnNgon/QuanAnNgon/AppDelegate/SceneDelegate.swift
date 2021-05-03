//
//  SceneDelegate.swift
//  ExpenseManagement
//
//  Created by MBP0037 on 4/30/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UITabBarControllerDelegate {

    var window: UIWindow?
    var navigation: UINavigationController?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        self.window = window
        window.makeKeyAndVisible()
        let isAuth = UserDefaultsService.isAuthLogin()
        changeScreen(type: isAuth ? .tabbar : .login)
    }
    
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            createLogin()
        case .tabbar:
            createTabbar()
        }
    }
    
    private func createLogin() {
        window?.rootViewController = LoginViewController()
    }
    
    private func createTabbar() {
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        let imgRe = UIImage(named: "icon-restaurants")
        homeNavi.tabBarItem = UITabBarItem(title: "Nhà Hàng", image: imgRe, tag: 0)
        
        let restaurantsManagerVC = RestaurantsManagerViewController()
        let restaurantsManagerNavi = UINavigationController(rootViewController: restaurantsManagerVC)
        let imgMa = UIImage(named: "icon-manager")
        restaurantsManagerNavi.tabBarItem = UITabBarItem(title: "Quản Lý", image: imgMa, tag: 1)
        
        //tabbar controller
        let tabbarController = UITabBarController()
        tabbarController.delegate = self
        tabbarController.viewControllers = [homeNavi, restaurantsManagerNavi]
        tabbarController.tabBar.tintColor = .black
        
        window?.rootViewController = tabbarController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

