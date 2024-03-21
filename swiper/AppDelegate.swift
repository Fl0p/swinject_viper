//
//  AppDelegate.swift
//  swiper
//
//  Created by Flop on 19.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = ViewController()
        mainVC.title = "Swiper"
        mainVC.view.backgroundColor = .red
        let navVC = UINavigationController(rootViewController: mainVC)
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

