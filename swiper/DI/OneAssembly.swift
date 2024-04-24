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
                print("Route type: \(route)")
                let vc = UIViewController()
                switch route {
                case .kek:
                    vc.view.backgroundColor = .red
                case .lol(let str):
                    vc.view.backgroundColor = .blue
                    vc.title = str
                case .aza(_):
                    print("nothing here`")
                }
                
                return vc
            }

            let interactor = LoadingInteractor()
            let presenter = LoadingPresenter(interactor: interactor, router: router)
            let viewController = LoadingViewController(presenter: presenter)
            return viewController
        }
        
        container.register(MainViewController.self) { r, nav in
            let router = MainRouter(root: nav)
            router.addRoute(MainRoute.self) { route in
                print("Route type: \(route)")
                let vc = UIViewController()
                switch route {
                case .kek:
                    vc.view.backgroundColor = .red
                case .lol(let str):
                    vc.view.backgroundColor = .blue
                    vc.title = str
                case .aza(_):
                    print("nothing here`")
                }
                
                return vc
            }

            let interactor = MainInteractor()
            let presenter = MainPresenter(interactor: interactor, router: router)
            let viewController = MainViewController(presenter: presenter)
            return viewController
        }
        
    }
}
