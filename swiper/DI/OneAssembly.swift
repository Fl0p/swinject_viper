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
        
        container.register(LoadingInteractor.self) { _ in
            return LoadingInteractor()
        }
        
        container.register(LoadingViewController.self) { r, nav in
            let router = LoadingRouter(root: nav)
            let interactor = r.resolve(LoadingInteractor.self)!
            let presenter = LoadingPresenter(router: router, interactor: interactor)
            let viewController = LoadingViewController(presenter: presenter)
            return viewController
        }.initCompleted { _, viewController in
            viewController.presenter.router.own = viewController
        }
        
        
    }
}
