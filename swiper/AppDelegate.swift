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
        let loader = AppLoader()
        self.window?.rootViewController = loader.rvc
        self.window?.makeKeyAndVisible()
        return true
    }


}

