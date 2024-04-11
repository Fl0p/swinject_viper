//
//  AppLoader.swift
//  swiper
//
//  Created by Flop on 11.04.2024.
//

import Foundation
import UIKit

class AppLoader {
    
    var rvc: UIViewController {
        self.navigationController
    }

    private lazy var launchScreenVC: UIViewController = {
        let storyboard = UIStoryboard(name: "Launch", bundle: nil)
        let launchScreenVC = storyboard.instantiateInitialViewController()
        return launchScreenVC ?? UIViewController()
    }()

    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: self.launchScreenVC)
        DispatchQueue.main.async {
            self.loadApp()
        }
        return navigationController
    }()
    
    init() {
        print("AppLoader init")
    }

    private func loadApp() {
        let mainVC = ViewController()
        mainVC.title = "Swiper"
        mainVC.view.backgroundColor = .lightGray
        self.navigationController.setViewControllers([mainVC], animated: true)
    }
}
