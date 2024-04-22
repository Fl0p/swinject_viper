//
//  LoadingRouter.swift
//  swiper
//
//  Created by Flop on 18.04.2024.
//

import Foundation
import UIKit

protocol LoadingRouterProtocol: RouterProtocol {
    func kek()
}

enum LoadingRoute: Route {
    case kek
    case lol(String)
    case aza(Int)
}

final class LoadingRouter: RouterBase<UINavigationController>, LoadingRouterProtocol {
    
    override func onStart() {
        super.onStart()
        guard let own else { return }
        self.root.setViewControllers([own], animated: true)
    }
    
    func kek() {
        let route = LoadingRoute.kek
        let vc = self.route(route)
        self.root.pushViewController(vc, animated: true)
    }
    
}
