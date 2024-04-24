//
//  AppLoader.swift
//  swiper
//
//  Created by Flop on 11.04.2024.
//

import Foundation
import UIKit
import Swinject

class AppLoader {

    //DI here
    private lazy var assembler: AppAssembler = {
        AppAssembler()
    }()
    
    var resolver: Resolver {
        return self.assembler.resolver
    }
    
    var rvc: UIViewController {
        self.navigationController
    }

    
    private lazy var launchScreenVC: UIViewController = {
        let storyboard = UIStoryboard(name: "Launch", bundle: nil)
        let launchScreenVC = storyboard.instantiateInitialViewController()
        return launchScreenVC ?? UIViewController()
    }()

    private lazy var navigationController: UINavigationController = {
        return UINavigationController(rootViewController: self.launchScreenVC)
    }()
    
    init() {
        print("AppLoader init")
        DispatchQueue.main.async {
            self.loadApp()
        }
    }

    private func loadApp() {
        let loading = self.resolver.resolve(
            MainViewController.self,
            argument: self.navigationController
        )!
        loading.start()
    }
}
