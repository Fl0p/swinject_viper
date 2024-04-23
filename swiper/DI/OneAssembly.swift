//
//  OneAssemply.swift
//  swiper
//
//  Created by Flop on 17.04.2024.
//

import Foundation
import Swinject
import UIKit

final class OneAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(LoadingViewController.self) { r, nav in
            let router = LoadingRouter(root: nav)
            router.addRoute(LoadingRoute.self) { route in
                print("Unexpected route type: \(route)")
                return UIViewController()
            }

            let interactor = LoadingInteractor()
            let presenter = LoadingPresenter(interactor: interactor, router: router)
            let viewController = LoadingViewController(presenter: presenter)
            return viewController
        }
        
        
    }
}
