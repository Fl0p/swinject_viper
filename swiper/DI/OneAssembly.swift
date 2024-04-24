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
        
        container.register(LoadingRouter.self) { r in
            let router = LoadingRouter()
            router.addRoute(LoadingRoute.self) { router, route in
                let main = r.resolve(MainViewController.self)!
                switch route {
                case .loaded(let int):
                    main.start(root: router.root!, data: int)
                }
            }
            return router
        }
        container.register(LoadingViewController.self) { r in
            let router = r.resolve(LoadingRouter.self)!
            let interactor = LoadingInteractor()
            let presenter = LoadingPresenter(interactor: interactor, router: router)
            let viewController = LoadingViewController(presenter: presenter)
            return viewController
        }
        
        container.register(MainRouter.self) { r in
            let router = MainRouter()
            router.addRoute(MainRoute.self) { router, route in
                print("Router : \(router) route: \(route)")
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
            }
            return router
        }
        
        container.register(MainViewController.self) { r in
            let router = r.resolve(MainRouter.self)!
            let interactor = MainInteractor()
            let presenter = MainPresenter(interactor: interactor, router: router)
            let viewController = MainViewController(presenter: presenter)
            return viewController
        }
        
    }
}
