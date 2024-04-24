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
        
        container.register(LoadingRouter.self) { r, root in
            let rnc: UINavigationController = root
            let router = LoadingRouter(root: rnc)
            router.addRoute(LoadingRoute.self) { route in
                let vc = r.resolve(MainViewController.self, argument: root)!
                switch route {
                case .loaded(let int):
                    vc.presenter.interactor.acceptInitialData(int)
                }
                return vc
            }
            return router
        }
        container.register(LoadingViewController.self) { r, root in
            let rnc: UINavigationController = root
            let router = r.resolve(LoadingRouter.self, argument: rnc)!
            let interactor = LoadingInteractor()
            let presenter = LoadingPresenter(interactor: interactor, router: router)
            let viewController = LoadingViewController(presenter: presenter)
            return viewController
        }
        
        container.register(MainRouter.self) { r, root in
            let rnc: UINavigationController = root
            let router = MainRouter(root: rnc)
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
            return router
        }
        
        container.register(MainViewController.self) { r, root in
            let rnc: UINavigationController = root
            let router = r.resolve(MainRouter.self, argument: rnc)!
            let interactor = MainInteractor()
            let presenter = MainPresenter(interactor: interactor, router: router)
            let viewController = MainViewController(presenter: presenter)
            return viewController
        }
        
    }
}
