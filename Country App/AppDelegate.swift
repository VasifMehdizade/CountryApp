//
//  AppDelegate.swift
//  Country App
//
//  Created by Vasif Mehdi on 14.11.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
//        let navigationController = UINavigationController(rootViewController: nextViewController)

        
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageController") as! MainPageController
            let navigationController = UINavigationController(rootViewController: nextViewController)
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window?.rootViewController = navigationController
        }
        else{
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
            let navigationController = UINavigationController(rootViewController: nextViewController)
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()

        return true
    }

}
